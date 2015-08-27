# Maintainer: Matt Corallo <aur-maint@mattcorallo.com>
# Creator: Stéphane Marguet (Stemp) <smarguet à gmail point com>
# Contributer: Toni Foerster <stonerl@skeps.de>, AndrÃ© Klitzing <aklitzing@online.de>

pkgname=po-debconf
pkgver=1.0.16
pkgrel=3
pkgdesc="Debian manage translated Debconf templates files with gettext"
arch=('i686' 'x86_64')
url="http://www.debian.org/"
license=('GPL')
changelog=ChangeLog
depends=('gettext' 'perl' 'intltool-debian')
source=(http://ftp.debian.org/debian/pool/main/p/po-debconf/${pkgname}_${pkgver}+nmu2_all.deb)
sha256sums=('aec4d18a310988aebc55a14db7e5fd0dfee6b49cca1d5aa6e7e58b8645a7d29e')

build() {
	cd $srcdir
	ar -x $srcdir/${pkgname}_${pkgver}+nmu2_all.deb data.tar.gz
	tar -zxf $srcdir/data.tar.gz
}

package() {
	cp -r $srcdir/usr/ $pkgdir
}
