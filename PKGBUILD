# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetruntime-bin
pkgver=1.2.4.0
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
md5sums_armv7h=('8ae301135091b239a85ef857927e3f25')
md5sums_aarch64=('138cf159df9e197db0a72de2ab562542')
sha1sums_armv7h=('aab8ea77afb052e682c878b1f6b24d744ba1dc86')
sha1sums_aarch64=('7c48b8801ba4b96c12f81955b8c92baa176cfd3a')
sha256sums_armv7h=('1ef0169a6de68c4a647a4c5868f15eda55e3f1f64cb7d892df57866558793163')
sha256sums_aarch64=('abef7988b2e40d9a8c1bab3873c821ac11280cbe1b45688b801fb2d4c9279e2b')
sha512sums_armv7h=('ff070fa6261dd40aebdf3250da241f9ac6fba705e8ab97908d8245e3af6a33f040fd4124a17606527dc01d83baf88b925b296c3abe2ddb1770ac7ea4dabb5c9b')
sha512sums_aarch64=('590231fe139aaa944669c6e81456623ad721a3d4a2bdaff1cafa7787a79e8b556be29d5f1dec8b79aeeeb02a5caeeb1e3ed3df991aefb9d832a601dc4b346d3c')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}"/opt/dsf/bin
	install -m 644 "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"
}
