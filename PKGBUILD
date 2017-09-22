# Maintainer: stef204 < base64 -d c3RlZjIwNEB5YW5kZXguY29tCg== >
# Contributer: giacomogiorgianni@gmail.com

pkgname=quiterss-qt4
_pkgname=QuiteRSS
pkgver=0.18.8
pkgrel=1
pkgdesc='Fast and light RSS/Atom feed reader written on Qt/С++'
arch=('i686' 'x86_64')
url='http://quiterss.org/'
license=('GPL3')
depends=('qtwebkit' 'phonon-qt4' 'icu')
makedepends=('cmake' 'gettext' 'automoc4')
conflicts=('quiterss')
source=("http://quiterss.org/files/$pkgver/$_pkgname-$pkgver-src.tar.gz")
sha512sums=('a39913c0a4d1693032234d4a0ebf70905427c9938427027751af72535efa6973667e55c7e331f25c2de8733a6730b3e5e56c5addef510f85c343d61460319d23')

build() {
  cd "$srcdir"
  qmake-qt4 "$srcdir/$_pkgname.pro" \
    PREFIX=/usr \
    CONFIG+=LINUX_INTEGRATED \
    INSTALL_ROOT_PATH="$pkgdir"

  make
}

package() {
  cd "$srcdir"
  make INSTALL_ROOT="$pkgdir" install
}

