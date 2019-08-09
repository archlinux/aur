# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetruntime
pkgver=1.0.3.1
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
sha256sums=('8879979ad2b69ffaaf8870cc653251b5b4d63a3902babc39b38cc67dbb416f51')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}"/opt/dsf/bin
	install -m 644 "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"
}
