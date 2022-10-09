# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=python-mkdocs-simple-hooks
_name=mkdocs-simple-hooks
pkgver=0.1.5
pkgrel=2
pkgdesc="Define your own hooks for mkdocs, without having to create a new package."
arch=(any)
url="https://github.com/aklajnert/mkdocs-simple-hooks"
license=('MIT')
depends=('python' 'mkdocs')
makedepends=('python-build' 'python-installer' 'python-wheel')
# checkdepends=('python-pytest' 'python-pytest-cov')
optdepends=()
provides=()
conflicts=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('dddbdf151a18723c9302a133e5cf79538be8eb9d274e8e07d2ac3ac34890837c')


build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

# check() {
# 	cd "$_name-$pkgver"
# 	pytest
# }

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
