# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Eduardo Parra Mazuecos <eduparra90@gmail.com>

_pkgname=lml
pkgname=python-$_pkgname
pkgver=0.0.9
pkgrel=2
pkgdesc="Load me later. A lazy loading plugin management system."
arch=('any')
url='https://github.com/python-lml/lml'
license=('BSD')
makedepends=('python-setuptools')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c9157e138fd3eba88ccb3047bfd7f8688d804f69f0c0c6199db038a49ccd014d')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
