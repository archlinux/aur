# Maintainer: Til Kaiser <mail at tk154 dot de>
pkgname=windscribe-cli-v2-bin
pkgver=2.18.8
pkgrel=1
pkgdesc="Windscribe CLI tool for Linux"
arch=('x86_64')
url="https://windscribe.com/guides/linux"
license=('GPL2')
depends=('nftables' 'c-ares' 'systemd' 'glibc>=2.28' 'glib2' 'zlib' 'gcc-libs' 'dbus' 'net-tools' 'sudo' 'shadow')
provides=('windscribe-cli')
conflicts=('windscribe-v2-bin' 'windscribe')
options=('!strip')
install=windscribe-cli-v2-bin.install
source=("https://github.com/Windscribe/Desktop-App/releases/download/v${pkgver}/windscribe-cli_${pkgver}_amd64.pkg.tar.zst")
sha256sums=('925c9f5cd282b3a951a9abd159ad8de0951bb5ab2e0a1be481dda101f6f2f53d')

package() {
	mv ${srcdir}/opt ${pkgdir}
	mv ${srcdir}/usr ${pkgdir}

	# Fix permissions on systemd unit
	chmod -x ${pkgdir}/usr/lib/systemd/system/windscribe-helper.service
}
