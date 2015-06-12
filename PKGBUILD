# Maintainer: Illarion Kovalchuk <illarion.kovalchuk@gmail.com>
pkgname=litmus
pkgver=0.13
pkgrel=3
pkgdesc="WebDAV server protocol compliance test suite"
arch=('any')
url="http://www.webdav.org/neon/litmus/"
license=('GPL')
groups=()
depends=('neon>=0.26')
makedepends=()
optdepends=()
provides=(litmus)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
#source=($pkgname-$pkgver.tar.gz)
source=(http://www.webdav.org/neon/litmus/$pkgname-$pkgver.tar.gz)
noextract=()
#makepkg -g
md5sums=('7c081e182214e771bc615232ef475b00')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --with-ssl --prefix=/usr --libexecdir=/usr/lib 
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
