# Maintainer: Bernard Baeyens (berbae)  <berbae52 at sfr dot fr>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=ipager
pkgver=1.1.0
pkgrel=10
pkgdesc="a lightweight beautiful pager from Fluxbox"
arch=('i686' 'x86_64')
license=('MIT')
#url="http://www.useperl.ru/ipager/index.en.html"
url="http://fluxbox.org/screenshots/"
depends=('imlib2' 'libxmu')
makedepends=('patch' 'scons')
#source=(http://www.useperl.ru/ipager/src/ipager-$pkgver.tar.gz ipager-1.1.0-20120429.patch)
source=(http://slackware.org.uk/slacky/slackware-13.0/desktop/ipager/1.1.0/src/ipager-1.1.0.tar.gz ipager-1.1.0-20120429.patch)
install=$pkgname.install
md5sums=('d74409836f5c31eb55a55f00783b1f6f' '073682d8f76e1e91b9d3f2415f4a6c52')

build() {
cd $srcdir/$pkgname-$pkgver
patch -p0 < $srcdir/ipager-1.1.0-20120429.patch
scons
}

package() {
cd $srcdir/$pkgname-$pkgver
scons PREFIX=/usr DESTDIR=$pkgdir install
install -d -m 755 $pkgdir/usr/share/ipager/themes
install -m 644 themes/*.conf $pkgdir/usr/share/ipager/themes
}
# vim:set ts=2 sw=2 et:
