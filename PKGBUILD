# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duettools-bin
pkgver=1.2.4.0
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
md5sums_armv7h=('2e7dc505a596e707266cae3943024853')
md5sums_aarch64=('75cc0d556c105c8520824111646ddb72')
sha1sums_armv7h=('1cd8b34f6c82a021346ae2929c948352cc36d978')
sha1sums_aarch64=('9357b03b8fdc2d2513ef7f1c342423aacf63199f')
sha256sums_armv7h=('77a34437056d6cb5fc895e5559d639eaf5356fc7671aba80e593fe82aa995c37')
sha256sums_aarch64=('92ca455ec2f15d7c39332db84e7c866cbc45803cdbf6ee70ba5999facdfb2802')
sha512sums_armv7h=('bad18fbe60091661506957edaf95fe20ba80bf0dbbea24d9e4d70c6c05cadc4ca0ab7300b12c4520ee72aca830bc15564f9c134b3332ec82a3075ca36aacdb75')
sha512sums_aarch64=('3b97a416552cdabc207230c36d85d65e8cf6fc9f179b2516df2f4c53684aca16b6788ba0bbd2ceee5587955608ec55bcebab4446b471011cbc9ea73ecb0aa1d7')

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
