# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duettools-bin
pkgver=3.2.0
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
md5sums_armv7h=('8c0736ce9f5adcc7cb8fcbbfbb9fcfff')
md5sums_aarch64=('5dd33576a4387d37829c2c22c9d93ba8')
sha1sums_armv7h=('6027d1b9d402d1ebb8183d2c942a219379005e1c')
sha1sums_aarch64=('1e33dd6e4d86eae27c3fd02f73713ed539f32670')
sha256sums_armv7h=('e71c4c084cb7bfd4a74c547fd594d96835f7b3fb006ffcd649fd468840b1fb12')
sha256sums_aarch64=('15f774ae640621f0ab9f450d6433032bc3138e8586d32656d129a8eb33431f54')
sha512sums_armv7h=('264a6dcceecf60584139d5077300ea0422569b78731c3c45a93c530dd56d5becba4b9629ab6b200705094b63d56f2c15d835adb1fe425085a40f1c360cfdec95')
sha512sums_aarch64=('55cde3c2857764f2f95156bf0c4f10327cf4ddb9de4c284e56b156de9da171fdcc7de0416580464bd002f31a0b09fb8946be04a86dcf00074f75e16997e1f1b5')

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
