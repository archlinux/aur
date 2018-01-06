# $Id: PKGBUILD 195386 2016-11-11 18:18:19Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: James Cozine <jmcozine@gmail.com>

pkgname="bbdb"
pkgver=3.1.2
pkgrel=4
pkgdesc="A rolodex-like database for Emacs"
arch=('any')
url="https://savannah.nongnu.org/projects/bbdb"
license=('GPL')
depends=('emacs')
makedepends=('texlive-bin' 'texlive-latexextra')
install="$pkgname.install"
validpgpkeys=('8085E99D2879C87C1CDE452998D4FA2244A3B825')
source=("https://download.savannah.gnu.org/releases/bbdb/bbdb-$pkgver.tar.gz"{,.sig})
md5sums=('b57cbb57ab8d4235517e79011fb52b2f'
         'SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}
