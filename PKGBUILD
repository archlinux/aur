# Maintainer: vyogami

pkgname=paruz
pkgver=1.1.5
pkgrel=1
pkgdesc="A terminal UI (TUI) for the paru AUR helper"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/Vyogami/paruz"
license=('MIT')
depends=('paru' 'pacman')
conflicts=('paruz-git' 'paruz-bin')
options=('!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/paruz_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/paruz_linux_arm64.tar.gz")
source_armv6h=("${pkgname}-${pkgver}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/paruz_linux_v6.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/paruz_linux_v7.tar.gz")

sha256sums_x86_64=('ea0ca5b8eabb706ac0506429bc2f3454ed986396802e8388bbfaa60262be5f41')
sha256sums_aarch64=('e61d21e8c452985bca386231baa660612eace3cbb50b7b8d2c4452e8c89e1866')
sha256sums_armv6h=('3867a756da18b00444ab3edfc3ef9475fda841e4f0cc254d241eec60a6043265')
sha256sums_armv7h=('f0cbb345aff637c2a6e6501244864b750566b9c2d3fba21b1d178e2d9db78b71')

package() {
	install -Dm755 "${srcdir}/paruz" "${pkgdir}/usr/bin/paruz"
	# LICENSE is bundled in release archives from v1.1.1 onward
	[ -f "${srcdir}/LICENSE" ] && \
		install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
