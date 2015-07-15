# Contributor: Adria Arrufat <swiftscythe@gmail.com>

pkgname=libgtop11dotnet
pkgver=2.2.0.12
pkgrel=1
pkgdesc='PKCS11 driver for the Gemalto Cryptocard token'
arch=('i686' 'x86_64')
url="http://www.gemalto.com"
license=('custom')
depends=('boost-libs' 'pcsclite' 'p11-kit' 'pcsc-tools' 'opensc' 
'openct' 'openvpn' 'ccid' 'engine_pkcs11' 'pkcs11-helper')
makedepends=('boost')
source=(https://www.nemid.nu/dk-da/support/aktiver_nemid/aktiver_nemid_paa_hardware/installer_driver/drivers/${pkgname}_${pkgver}.tar.gz)
md5sums=('0d2ac6dc267377a5c3fad0117d8d5a6d')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr/
	make all-am
}

package()
{
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install-exec-am
}
