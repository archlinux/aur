# Maintainer: Avi Zimmerman <avi.zimmerman@gmail.com>

pkgname=nzyme-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Nzyme is a free and open next-generation WiFi defense system."

arch=( x86_64 )

url="https://assets.nzyme.org/releases"
source=( "${url}/${pkgname}-${pkgver}.deb" )
sha256sums=( "b01c938a05767242606f0d855d6835b2216b1ad6ae8760c695c924797617d6a1" )

depends=( jre11-openjdk-headless libpcap wireless_tools postgresql )

package() {
	cd ${srcdir}/
	tar -C ${pkgdir}/ -xf data.tar.gz
	sed -i 's:/usr/bin/java:/usr/lib/jvm/java-11-openjdk/bin/java:' ${pkgdir}/usr/bin/nzyme-tracker
}
