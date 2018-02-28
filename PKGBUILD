# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=mwic
pkgver=0.7.4
pkgrel=1
pkgdesc='Misspelled Words In Context'
arch=('any')
url=https://github.com/jwilk/mwic
license=('MIT')
depends=('python-pyenchant' 'python-regex')
makedepends=('python-docutils')
checkdepends=('aspell-en' 'python-nose')
source=("mwic-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('c9ee668c2f0ef6a99dbdfb4b0560a69c408421e90c932f39b63cd11c97e35653f6615d134d9d4a9202f9cd7921b913813d6fca00b38bd29bf7c01cfa90c89963')

prepare() {
  cd mwic-$pkgver
  make -C doc
}

check() {
  cd mwic-$pkgver
  make test
}

package() {
  cd mwic-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/mwic/LICENSE
}

# vim:set ts=2 sw=2 et:
