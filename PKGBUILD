# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Previous maintainer: Matt Corallo <aur-maint@mattcorallo.com>
# Creator: Stéphane Marguet (Stemp) <smarguet à gmail point com>
# Contributer: Toni Foerster <stonerl@skeps.de>, AndrÃ© Klitzing <aklitzing@online.de>

pkgname=po-debconf
pkgver=1.0.22
pkgrel=1
pkgdesc="Debian manage translated Debconf templates files with gettext"
arch=('any')
url="http://www.debian.org/"
license=('GPL')
changelog=ChangeLog
depends=(gettext perl intltool)
source=(https://deb.debian.org/debian/pool/main/p/po-debconf/${pkgname}_${pkgver}_all.deb)
sha256sums=('e40fb5a74cb23cf5d25f49474a8092af35d855fba4a32c6f9bb4fba85d4dae68')

build() {
	cd $srcdir
	ar -x $srcdir/${pkgname}_${pkgver}_all.deb data.tar.xz
	tar -xJf $srcdir/data.tar.xz
}

package() {
	cp -r $srcdir/usr/ $pkgdir
}
