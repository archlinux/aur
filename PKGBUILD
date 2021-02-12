# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetruntime-bin
pkgver=3.2.2
pkgrel=1
pkgdesc=".NET Core runtime libraries for the Duet software framework"
arch=('armv7h' 'aarch64')
url="https://github.com/Duet3D/DuetSoftwareFramework.git"
license=('GPL3')
provides=("duetruntime=${pkgver}")
conflicts=('duetruntime')
depends=('curl' 'gettext' 'libunwind')
options=(!strip staticlibs)
source_armv7h=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetruntime_${pkgver}_armhf.deb")
source_aarch64=("https://pkg.duet3d.com/dists/stable/armv7/binary-arm64/duetruntime_${pkgver}_arm64.deb")
md5sums_armv7h=('036f171a4e18534657c67fa5d70bd765')
md5sums_aarch64=('36ae4d2c93c8bc530252ba98d61ef812')
sha1sums_armv7h=('950e9937e9894ddf9921db610075ce6caaf944b0')
sha1sums_aarch64=('f6de5e4bbfc2bac20ea6a695041ecfc28a2ffe50')
sha256sums_armv7h=('e7dee31f064ec9af2d9b358f5a6c21bcd950432b3998d921c0a09e24767e9644')
sha256sums_aarch64=('74e43e8fb8cd1bc906865873312cbe20b276503098a8522209995d39103cac3d')
sha512sums_armv7h=('69ca892ac3d8fb5b8f4019560838b5dc3a4fb5fb94e14082bce9aeb8661b0075c46885a90a9e56b7ae96f99214a47e5c726cc4b52d567e3fb279ec473f8154b6')
sha512sums_aarch64=('e132a51f23ef562246d25c03020eb88757b4b3105c2ed4e90e8739484316feece48af40509a67de826cc744b3f9ccd03b066a676d69695aca5b9f86d58b7183a')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}"/opt/dsf/bin
	install -m 644 "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"
}
