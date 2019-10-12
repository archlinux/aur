# Contributor: Andrea Squeri <andrea.squeri@gmail.com>

pkgname=libgtop11dotnet
pkgver=2019.04
pkgrel=1
pkgdesc='PKCS11 driver for the Gemalto Cryptocard token'
arch=('i686' 'x86_64')
url="https://github.com/smartcardservices/smartcardservices"
license=('custom:APPLE PUBLIC SOURCE LICENSE')
depends=('boost-libs' 'pcsclite' 'zlib' )
makedepends=('gcc' 'boost')
source=("git+https://github.com/smartcardservices/smartcardservices.git")
sha256sums=('SKIP')



build() {
	cd ${srcdir}/smartcardservices/SmartCardServices/src/PKCS11dotNetV2
        ./autogen.sh
	./configure --enable-system-boost --prefix=/usr/
	make
}

package()
{
	cd ${srcdir}/smartcardservices/SmartCardServices/src/PKCS11dotNetV2
        make DESTDIR="$pkgdir" install
}
