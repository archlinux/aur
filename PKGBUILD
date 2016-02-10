# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Previous maintainer: Matt Corallo <aur-maint@mattcorallo.com>
# Creator: Stéphane Marguet (Stemp) <smarguet à gmail point com>
# Contributer: Toni Foerster <stonerl@skeps.de>, AndrÃ© Klitzing <aklitzing@online.de>

pkgname=po-debconf
pkgver=1.0.19
pkgrel=1
pkgdesc="Debian manage translated Debconf templates files with gettext"
arch=('i686' 'x86_64')
url="http://www.debian.org/"
license=('GPL')
changelog=ChangeLog
depends=('gettext' 'perl' 'intltool-debian')
source=(http://ftp.debian.org/debian/pool/main/p/po-debconf/${pkgname}_${pkgver}_all.deb)
sha256sums=('78aaf6e3906f9b5e133c18e9c7fe59911bf39d4ab5b50f52ce83f3d94a0e173a')

build() {
	cd $srcdir
	ar -x $srcdir/${pkgname}_${pkgver}_all.deb data.tar.xz
	tar -xJf $srcdir/data.tar.xz
}

package() {
	cp -r $srcdir/usr/ $pkgdir
}
