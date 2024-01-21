# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-hwdata
pkgver=2.4.1
pkgrel=1
pkgdesc="Python bindings to hwdata"
arch=('any')
url="https://github.com/xsuchy/python-hwdata"
license=('GPL-2.0-or-later')
depends=('hwdata' 'python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pylint')
source=("https://github.com/xsuchy/python-hwdata/archive/refs/tags/$pkgname-$pkgver-1.tar.gz")
sha256sums=('a737e0a923c6233048257ad85f3c822544875bc5202c73aaa2808f39d49c29aa')

build() {
  cd "$pkgname-$pkgname-$pkgver-1"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgname-$pkgver-1"
  pylint hwdata.py example.py || :
}

package() {
  cd "$pkgname-$pkgname-$pkgver-1"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
