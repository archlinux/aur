# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetruntime-bin
pkgver=3.1.0
pkgrel=1
pkgdesc=".NET Core runtime libraries for the Duet software framework"
arch=('armv7h' 'aarch64')
url="https://github.com/chrishamm/DuetSoftwareFramework.git"
license=('GPL3')
provides=("duetruntime=${pkgver}")
conflicts=('duetruntime')
depends=('curl' 'gettext' 'libunwind')
options=(!strip staticlibs)
source_armv7h=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetruntime_${pkgver}_armhf.deb")
source_aarch64=("https://pkg.duet3d.com/dists/stable/armv7/binary-arm64/duetruntime_${pkgver}_arm64.deb")
md5sums_armv7h=('f34f7058e1be68ad9d1187a616a849bc')
md5sums_aarch64=('b918182eb194a3ee689558431694a941')
sha1sums_armv7h=('5458989b696cb80281ba17d23939c5b2011aa40d')
sha1sums_aarch64=('fc1714e5fe488ad0cac70c685f6a72135ad231b6')
sha256sums_armv7h=('d39f58585762e876cb1962bb3b628d44a23cac4bfba896b66b6b1ade13f34ace')
sha256sums_aarch64=('690c402f40d13df4ba019b6ebfe1e592454f98abf86d0539a45df0c3f2278e86')
sha512sums_armv7h=('9ab54753cb1175ba8f286462341ed520e20221249b113521079876dcce4ce3dcdcbc10cc2d9d5facbaf3735d724674981ab2e243ebc230cd8f65b53f20903bc1')
sha512sums_aarch64=('b84c0b24c3514301c324574f9f2eb671f5e00eb1acef719824da1e26bbee1bb3ca94d910606b0b8d419ebbe3ee5d902e5fb5c9c88e70f5f454c4e59d0c98bfb4')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}"/opt/dsf/bin
	install -m 644 "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"
}
