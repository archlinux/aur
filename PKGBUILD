# Contributor: Avi Zimmerman <avi.zimmerman@gmail.com>

pkgname=nzyme-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="Nzyme is a free and open next-generation WiFi defense system."
arch=( x86_64 )
url="https://assets.nzyme.org/releases/"
depends=(jre11-openjdk-headless libpcap wireless_tools postgresql)
source=("${url}/nzyme-${pkgver}.deb")
sha256sums=('fb59a0b60736a5ddb03a8c69c2a1b925b25726b32bf32b6e38b710741e5b122b')


package() {
	tar -C ${pkgdir}/ -xf data.tar.gz
	sed -i 's:/usr/bin/java:/usr/lib/jvm/java-11-openjdk/bin/java:' ${pkgdir}/usr/bin/nzyme-tracker
	sed -i 's:/usr/bin/java:/usr/lib/jvm/java-11-openjdk/bin/java:' ${pkgdir}/usr/share/nzyme/bin/nzyme
}
