# Author: Kyle Manna <kyle(at)kylemanna(dot)com>
#
# Upstream: https://nxp.flexnetoperations.com/control/frse/download?element=6320997
#
# Download the source file and place in the current directory.  Website requires login
# and license agreement.

pkgname=kinetis-design-studio-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="NXP / Freescale Kinetis Design Studio"
#arch=('i686' 'x86_64')
arch=('x86_64')
url="https://nxp.flexnetoperations.com/control/frse/download?element=6320997"
license=('EULA')
groups=('base-devel')
depends=()
options=('!strip')
source=('file://Kinetis Design Studio installer for Linux 64-bit DEB 3.0.0.deb')
sha512sums=('b563f779c2425fe370cc222d23e96dc9b244c38870a551d90b6390f93551556b9092a05ca1164d0d18eeddf010a9f743ef06c28b095a00ba8c8f985df6605950')

package() {
    tar -zxf data.tar.gz -C "${pkgdir}"

    # /lib is a symlink to /usr/lib
    mv "${pkgdir}/lib" "${pkgdir}/usr"
}
