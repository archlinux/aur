# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Previous maintainer: Matt Corallo <aur-maint@mattcorallo.com>
# Creator: Stéphane Marguet (Stemp) <smarguet à gmail point com>
# Contributer: Toni Foerster <stonerl@skeps.de>, AndrÃ© Klitzing <aklitzing@online.de>

pkgname=po-debconf
pkgver=1.0.21+nmu1
pkgrel=1
pkgdesc="Debian manage translated Debconf templates files with gettext"
arch=('any')
url="http://www.debian.org/"
license=('GPL')
changelog=ChangeLog
depends=(gettext perl intltool)
source=(https://deb.debian.org/debian/pool/main/p/po-debconf/${pkgname}_${pkgver}_all.deb)
sha256sums=('613e31942c17b582e8c76db1077240f177f2f67bad22e5f4f8e5bee523d6f54b')

build() {
	cd $srcdir
	ar -x $srcdir/${pkgname}_${pkgver}_all.deb data.tar.xz
	tar -xJf $srcdir/data.tar.xz
}

package() {
	cp -r $srcdir/usr/ $pkgdir
}
