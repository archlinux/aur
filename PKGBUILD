# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Previous maintainer: Matt Corallo <aur-maint@mattcorallo.com>
# Creator: Stéphane Marguet (Stemp) <smarguet à gmail point com>
# Contributer: Toni Foerster <stonerl@skeps.de>, AndrÃ© Klitzing <aklitzing@online.de>

pkgname=po-debconf
pkgver=1.0.18
pkgrel=1
pkgdesc="Debian manage translated Debconf templates files with gettext"
arch=('i686' 'x86_64')
url="http://www.debian.org/"
license=('GPL')
changelog=ChangeLog
depends=('gettext' 'perl' 'intltool-debian')
source=(http://ftp.debian.org/debian/pool/main/p/po-debconf/${pkgname}_${pkgver}_all.deb)
sha256sums=('2842ee181138de994f680a157c5915391f1163cce40be9691c8159015131bd2f')

build() {
	cd $srcdir
	ar -x $srcdir/${pkgname}_${pkgver}+nmu2_all.deb data.tar.gz
	tar -zxf $srcdir/data.tar.gz
}

package() {
	cp -r $srcdir/usr/ $pkgdir
}
