# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hpsmh
pkgver=7.1.0_16
pkgrel=1
pkgdesc="HP System Management Homepage"
arch=(i686 x86_64)
url="http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack"
depends=(bash perl pam)
groups=(hpproliant)
license=("CUSTOM")
options=(!strip)

[ $CARCH = "x86_64" ] \
	&& depends=(${depends[@]} lib32-glibc lib32-expat lib32-zlib) \
	|| depends=(${depends[@]} expat zlib)

source=(http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack/RedHatEnterpriseServer/6.2/packages/i386/${pkgname}-${pkgver//_/-}.i386.rpm)

package() {
	cp -a "$srcdir/"{etc,opt,usr,var} "$pkgdir"
}

sha256sums=('cf13d032330a234dbf960df6c7126517713e695be95e98b2e098d756f243884f')

