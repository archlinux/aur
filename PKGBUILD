# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-userspacefs
_name=${pkgname#python-}
pkgver=2.0.6
pkgrel=1
pkgdesc="Cross-platform user-space file systems for Python"
arch=('any')
url="https://thelig.ht/code/userspacefs"
license=('GPL3')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
conflicts=('python-fusepyng')
replaces=('python-fusepyng')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5a8f4d6d4c84d01eef6df9d0b1c0c632404dea94a1c3f6d1e1c173c79c2e4d49')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
