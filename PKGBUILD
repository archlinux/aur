# Maintainer: Your Name <your.email@example.com>
pkgname=aiven-client
_name=${pkgname//-/_}
pkgver=4.15.0
pkgrel=1
pkgdesc="Official command-line client for Aiven"
arch=('any')
url="https://github.com/aiven/aiven-client"
license=('Apache-2.0')
depends=('python>=3.10' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('069a08c035ce05fb8afef5d94baa5b5f79caddb5189115ac2c6eb6d1a201045c')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
