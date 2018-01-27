# Maintainer: stef204 < base64 -d c3RlZjIwNEB5YW5kZXguY29tCg== >
# Contributer: giacomogiorgianni@gmail.com

pkgname=quiterss-qt4
_pkgname=QuiteRSS
pkgver=0.18.9
pkgrel=1
pkgdesc='Fast and light RSS/Atom feed reader written on Qt/С++'
arch=('i686' 'x86_64')
url='http://quiterss.org/'
license=('GPL3')
depends=('qtwebkit' 'phonon-qt4' 'icu')
makedepends=('cmake' 'gettext' 'automoc4')
conflicts=('quiterss')
source=("http://quiterss.org/files/$pkgver/$_pkgname-$pkgver-src.tar.gz")
sha512sums=('d7f46e474724ddc1fd65a7bdcab02c14d9c4f090464a7c1bf77816e9a89436192dddb1e2f819a5d672aad41ee6703e9b0a0f34520989a28140ae60086860b295')

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

