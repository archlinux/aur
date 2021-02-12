# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duettools-bin
pkgver=3.2.2
pkgrel=1
pkgdesc="Optional tools (code examples)"
arch=('armv7h' 'aarch64')
url="https://github.com/Duet3D/DuetSoftwareFramework.git"
license=('GPL3')
provides=("duettools=${pkgver}")
conflicts=("duettools")
depends=("duetcontrolserver>=${pkgver}")
options=(!strip staticlibs)
source_armv7h=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duettools_${pkgver}_armhf.deb")
source_aarch64=("https://pkg.duet3d.com/dists/stable/armv7/binary-arm64/duettools_${pkgver}_arm64.deb")
md5sums_armv7h=('ae0a8dc8e248f3f51c71b9a9a6a18d7b')
md5sums_aarch64=('72971861a4d10fda3fe970fc7621fda8')
sha1sums_armv7h=('5443a00b853e0464b14e81cfe43c426ac4a193da')
sha1sums_aarch64=('9a3e1876e2aa79ef867883b88cf2c2121623a1eb')
sha256sums_armv7h=('d6a920bb1b207412bb8b222a1a1f4dfb5fdbe311d5c3b7994e10c74d5df9ce29')
sha256sums_aarch64=('ef173dc2d4c4a2282ec7e55ec8611c340623d002ddf790c40e73773f2876c0a9')
sha512sums_armv7h=('d5dd534c2dae5815ae8d57dec1ddf10a8472e72136dff10fda7eab8fc10d6a541cde5278e3f95bca1dccc2e721a5910569fe0c47fdb5a3b2e040523c0a45b91e')
sha512sums_aarch64=('085cfcb819b05712f4037a635e2327550178854d4572ee9f449e714fbacde9ee98653f2408111f96555a41c94fbddcabb56e09f5fcad98c750152e73f8ec7172')


prepare() {
    tar -xf data.tar.xz
}

package() {

	# DuetControlServer, DuetWebServer, CodeConsole, CodeLogger
	install -dm 755 "${pkgdir}"/{opt/dsf/bin,opt/dsf/conf,usr/bin}
	install "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"

	ln -s "/opt/dsf/bin/CodeConsole" "${pkgdir}/usr/bin/"
	ln -s "/opt/dsf/bin/CodeLogger" "${pkgdir}/usr/bin/"
	ln -s "/opt/dsf/bin/CustomHttpEndpoint" "${pkgdir}/usr/bin/"
	ln -s "/opt/dsf/bin/ModelObserver" "${pkgdir}/usr/bin/"
	ln -s "/opt/dsf/bin/PluginManager" "${pkgdir}/usr/bin/"
}
