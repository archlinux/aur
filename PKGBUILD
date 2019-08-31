# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetruntime
pkgver=1.0.3.2
pkgrel=1
pkgdesc=".NET Core runtime libraries for the Duet software framework"
arch=('armv7h')
url="https://github.com/chrishamm/DuetSoftwareFramework"
license=('GPL3')
provides=('duetruntime')
conflicts=('duetruntime')
depends=('curl' 'gettext' 'libunwind')
options=(!strip staticlibs)
source=("https://pkg.duet3d.com/dists/unstable/armv7/binary-armhf/duetruntime_${pkgver}.deb")
sha256sums=('b4aa43eab7e9ab30fdd3192267effc277635535b2b2c46eefdee4821b333b2aa')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}"/opt/dsf/bin
	install -m 644 "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"
}
