# Contributor: Andrea Squeri <andrea.squeri@gmail.com>

pkgname=libgtop11dotnet
pkgver=2.2.0.12
pkgrel=1
pkgdesc='PKCS11 driver for the Gemalto Cryptocard token'
arch=('i686' 'x86_64')
url="http://www.gemalto.com"
license=('custom')
depends=('boost-libs' 'pcsclite' 'p11-kit' 'pcsc-tools' 'opensc' 
'openct' 'openvpn' 'ccid' 'engine_pkcs11' 'pkcs11-helper')
makedepends=('gcc5' 'boost')
source=(https://dl.dropboxusercontent.com/u/11181009/${pkgname}_${pkgver}.tar.gz)
md5sums=('0d2ac6dc267377a5c3fad0117d8d5a6d')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
    export CC=/usr/bin/gcc-5
    export CXX=/usr/bin/g++-5
	./configure --prefix=/usr/
	make all-am
}

package()
{
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install-exec-am
}
