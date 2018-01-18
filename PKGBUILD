# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: James Cozine <jmcozine@gmail.com>

pkgname="bbdb"
pkgver=3.1.2
pkgrel=5
pkgdesc="A rolodex-like database for Emacs"
arch=('any')
url="https://savannah.nongnu.org/projects/bbdb"
license=('GPL')
depends=('emacs')
makedepends=('texlive-bin' 'texlive-latexextra')
install="$pkgname.install"
source=("https://download.savannah.gnu.org/releases/bbdb/bbdb-$pkgver.tar.gz"{,.sig})
validpgpkeys=('8085E99D2879C87C1CDE452998D4FA2244A3B825') # Roland Winkler
sha256sums=('05780f030584ddaa717d04700bc70e7d9e929141223c7f130fc0c778d73241bf'
            'SKIP')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir"
}
