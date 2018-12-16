# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Previous maintainer: Matt Corallo <aur-maint@mattcorallo.com>
# Creator: Stéphane Marguet (Stemp) <smarguet à gmail point com>
# Contributer: Toni Foerster <stonerl@skeps.de>, AndrÃ© Klitzing <aklitzing@online.de>

pkgname=po-debconf
pkgver=1.0.21
pkgrel=1
pkgdesc="Debian manage translated Debconf templates files with gettext"
arch=('any')
url="http://www.debian.org/"
license=('GPL')
changelog=ChangeLog
depends=('gettext' 'perl' 'intltool-debian')
source=(https://deb.debian.org/debian/pool/main/p/po-debconf/${pkgname}_${pkgver}_all.deb)
sha256sums=('0c293549b93c65ca6ca410639065d6f2ebcc5ceb2138b51da4fb9a904136733c')

build() {
	cd $srcdir
	ar -x $srcdir/${pkgname}_${pkgver}_all.deb data.tar.xz
	tar -xJf $srcdir/data.tar.xz
}

package() {
	cp -r $srcdir/usr/ $pkgdir
}
