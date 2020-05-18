# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duettools-bin
pkgver=3.1.0
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
md5sums_armv7h=('c273261e9dba742bb7758e53afa9478b')
md5sums_aarch64=('92595b5df19b5c92bc20a573890dd1a7')
sha1sums_armv7h=('06ffbf638c868b89d1cf468c145323f585c72c0b')
sha1sums_aarch64=('9df3cdedc949103a7ce5a73cd1abb9007604009e')
sha256sums_armv7h=('527074f52e76dbf6d80db62edf4d96540c9e5a5dd85f1ed4a4b99d9a895924f7')
sha256sums_aarch64=('b4dd0bd993c6b94a89bcaa955c46fb5ae6b4ecb4725f34e300b22999f161efec')
sha512sums_armv7h=('e2fbd36ca4e732ab439e4ea3956c977e0b72905c0b2fda439bdb8dd7d5adca2ddfcf5d236ea5aecbcbac62d7d257a5493d4bbb51f34efb5bdc6f4b60d06ce6a6')
sha512sums_aarch64=('dfb7cc7e4f655e195acb5fc5a06f6d19734d857b4ac0e03e4dde09e5e557d4f3a6c4b91839c34f6800f357fffb84b0230fb0c615b2647825a8b730e8780a46a0')

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
