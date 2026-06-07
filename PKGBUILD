# Maintainer: vyogami

pkgname=paruz
pkgver=1.1.4
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

sha256sums_x86_64=('0b4a36e3905da2b11e5731ede8244abd5c9ed241dccf034ccfcc8bbcd9aab443')
sha256sums_aarch64=('49b9b3c91c7cf769d467a87d6d9da2f8c3dd42575c1d7ce6e9cfc6699bec9c48')
sha256sums_armv6h=('457ae0b6a5645b43fc9cd637bc621319dd276692107b6625971c83c350e37da9')
sha256sums_armv7h=('b84ead61146c66e5155535a8173641deb7272efad4018960266addc60303b956')

package() {
	install -Dm755 "${srcdir}/paruz" "${pkgdir}/usr/bin/paruz"
	# LICENSE is bundled in release archives from v1.1.1 onward
	[ -f "${srcdir}/LICENSE" ] && \
		install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
