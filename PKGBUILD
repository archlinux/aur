# Maintainer: stef204 < base64 -d c3RlZjIwNEB5YW5kZXguY29tCg== >
# Contributer: giacomogiorgianni@gmail.com

pkgname=quiterss-qt4
_pkgname=QuiteRSS
pkgver=0.18.4
pkgrel=1
pkgdesc='Fast and light RSS/Atom feed reader written on Qt/С++'
arch=('i686' 'x86_64')
url='http://quiterss.org/'
license=('GPL3')
depends=('qtwebkit' 'phonon-qt4' 'icu')
makedepends=('cmake' 'gettext' 'automoc4')
conflicts=('quiterss')
source=("http://quiterss.org/files/$pkgver/$_pkgname-$pkgver-src.tar.gz")
sha512sums=('effca5c2f187d8eb73838c2668a14bcf64dfd99c2e4a3f2f70fa344e9b74073e588477f74e1f5750d96f8bff7ee765306d5bf91aecd1c2155d60bf0c51e0e3e9')

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

