# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duettools-bin
pkgver=3.1.1
pkgrel=1
pkgdesc="Optional tools (code examples)"
arch=('armv7h' 'aarch64')
url="https://github.com/chrishamm/DuetSoftwareFramework.git"
license=('GPL3')
provides=("duettools=${pkgver}")
conflicts=("duettools")
depends=("duetcontrolserver>=${pkgver}")
options=(!strip staticlibs)
source_armv7h=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duettools_${pkgver}_armhf.deb")
source_aarch64=("https://pkg.duet3d.com/dists/stable/armv7/binary-arm64/duettools_${pkgver}_arm64.deb")
md5sums_armv7h=('fc9194517d7f785cf0f2712e0c653fe0')
md5sums_aarch64=('0555f1139478a9324868fe6182054979')
sha1sums_armv7h=('348e3096ffa297a76ad0a0605745d968c9ad6186')
sha1sums_aarch64=('3b0f8d94e3e22a2ae87f364366a85715b52f79fe')
sha256sums_armv7h=('b60b992189a8cd047a50fd890597dff76b95a6791161892aa56231475ffbab9f')
sha256sums_aarch64=('eca467abf26d1455f658b3567a8886374dc945fac86de918d45ba28bb2520e79')
sha512sums_armv7h=('5eb8236da1228f3caafd2e47f12e18bdf0c756b70b90c0838602046e34ecf5f455b6c62a3ed0c59490c31ab7aa9e391b16de9c4178d94ccdc1a6f893567ce765')
sha512sums_aarch64=('67b76b7114850cabae9433b5a2ad164262b1a724e07c4fb1df4e23c2bddfb2a991dfb612cefd5eb1686c2bb3f8708f858a9ce93d9699c9e338ee6c1689998c74')

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
}
