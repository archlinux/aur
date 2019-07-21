# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetruntime
pkgver=1.0.2.1
pkgrel=1
pkgdesc=".NET Core runtime libraries for the Duet software framework"
arch=('armv7h')
url="https://github.com/chrishamm/DuetSoftwareFramework"
license=('GPL3')
provides=('duetruntime')
conflicts=('duetruntime')
depends=('gettext' 'libunwind')
options=(!strip staticlibs)
source=("https://chrishamm.io/debian/dists/stretch/dsf/binary-armhf/duetruntime_${pkgver}.deb")
sha256sums=('1f7a4e08616f001fba8b5c5584dfddb8c4b493c3edda74e0d826d5d88599e8e2')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}"/opt/dsf/bin
	install -m 644 "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"
}
