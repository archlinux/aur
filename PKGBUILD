# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetruntime
pkgver=1.0.3.0
pkgrel=1
pkgdesc=".NET Core runtime libraries for the Duet software framework"
arch=('armv7h')
url="https://github.com/chrishamm/DuetSoftwareFramework"
license=('GPL3')
provides=('duetruntime')
conflicts=('duetruntime')
depends=('curl' 'gettext' 'libunwind')
options=(!strip staticlibs)
source=("https://chrishamm.io/debian/dists/buster/dsf/binary-armhf/duetruntime_${pkgver}.deb")
sha256sums=('a3af1ef2c716487ef851482cc375affb3deb4cd088a9eeac5413d72e6c24bb1b')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}"/opt/dsf/bin
	install -m 644 "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"
}
