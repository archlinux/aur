# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetruntime
pkgver=1.0.1.0
pkgrel=1
pkgdesc=".NET Core runtime libraries for the Duet software framework"
arch=('armv7h')
url="https://github.com/chrishamm/DuetSoftwareFramework"
license=('GPL3')
provides=('duetruntime')
conflicts=('duetruntime')
depends=('gettext' 'libunwind')
options=(!strip staticlibs)
source=('https://chrishamm.io/debian/dists/stretch/dsf/binary-armhf/duetruntime_1.0.1.0.deb')
sha256sums=('24f60bcbe7e669954e765f79884a5f92bc28d2497f5679cf4fef74f224840384')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}"/opt/dsf/bin
	install -m 644 "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"
}
