# Contributor: jose <jose1711 [at] gmail (dot) com>

pkgname=olpw
pkgver=1
pkgrel=2
pkgdesc="Online Planning Worksheets - tool to help with HACMP cluster planning"
arch=('i686')
url="http://www-03.ibm.com/systems/power/software/availability/aix/apps/applications.html"
license="custom:EULA"
depends=('java-runtime' 'bash')
install=(olpw.install)
source=("http://www-03.ibm.com/systems/resources/systems_power_software_availability_aix_olpw.zip")
md5sums=('4d8534e42620f4a9a87d00f303c5bca4')

build() {
true
}

package() {
mkdir -p $pkgdir/usr/bin
(echo "#!/bin/bash
java -jar /usr/share/java/olpw/worksheets.jar \"\$@\"") > $pkgdir/usr/bin/olpw
chmod 755 $pkgdir/usr/bin/olpw
install -D -m644 $srcdir/worksheets.jar $pkgdir/usr/share/java/olpw/worksheets.jar
install -D -m644 $srcdir/lic.txt $pkgdir/usr/share/java/olpw/lic.txt
}
