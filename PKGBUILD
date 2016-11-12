# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Previous maintainer: Matt Corallo <aur-maint@mattcorallo.com>
# Creator: Stéphane Marguet (Stemp) <smarguet à gmail point com>
# Contributer: Toni Foerster <stonerl@skeps.de>, AndrÃ© Klitzing <aklitzing@online.de>

pkgname=po-debconf
pkgver=1.0.20
pkgrel=2
pkgdesc="Debian manage translated Debconf templates files with gettext"
arch=('any')
url="http://www.debian.org/"
license=('GPL')
changelog=ChangeLog
depends=('gettext' 'perl' 'intltool-debian')
source=(http://ftp.debian.org/debian/pool/main/p/po-debconf/${pkgname}_${pkgver}_all.deb)
sha256sums=('493dcfe155a49b97689403d440b9c953caabc89ccedc4d0297db675ec4db09a1')

build() {
	cd $srcdir
	ar -x $srcdir/${pkgname}_${pkgver}_all.deb data.tar.xz
	tar -xJf $srcdir/data.tar.xz
}

package() {
	cp -r $srcdir/usr/ $pkgdir
}
