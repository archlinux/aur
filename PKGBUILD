# Contributor: Kevin Brubeck Unhammer <unhammer+dill@mm.st>
# Maintainer: Kevin Brubeck Unhammer <unhammer+dill@mm.st>
pkgname=ordbanken
pkgver=2016.03.20
pkgrel=1
pkgdesc="Look up Norwegian Nynorsk or Bokmål words in an inflectional dictionary"
url="http://huftis.org/artiklar/ordbanken/"
license=('GPL3')
makedepends=('')
depends=('')
arch=('i686' 'x86_64')
source=("http://download-mirror.savannah.gnu.org/releases/$pkgname/$pkgname-${pkgver//./-}.tar.xz")
md5sums=('dd5d84f8c43bd60d23b813cd103f1e91')
sha256sums=('0d89b8457c7456212a02b025c6dd995899278551aec57c6be102e4ac4dd264b6')

build() {
  cd "$srcdir/$pkgname"
  make PREFIX="/usr"
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
