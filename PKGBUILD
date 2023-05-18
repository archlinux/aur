pkgname=mqttui-bin
pkgver=0.19.0
pkgrel=2
pkgdesc="Subscribe to a MQTT Topic or publish something quickly from the terminal"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/EdJoPaTo/${pkgname/-bin/}"
license=('GPL3')
depends=('gcc-libs')
provides=("${pkgname/-bin/}")
conflicts=("${pkgname/-bin/}")

source_x86_64=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source_armv6h=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-arm-unknown-linux-gnueabihf.tar.gz")
source_armv7h=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")

sha256sums_x86_64=('ab9895bcac0b2088acf70bc08713fd80e751526586754f7cc442f4bc3cb61c4f')
sha256sums_aarch64=('6f73f2c94423acb46bd8f51ddff7f820c727fab0071ddc2dad530b1ddc1968c5')
sha256sums_armv6h=('68176e4c797f70e6a4785f731d709ae147180c2c976b0744bf4461f5b060f734')
sha256sums_armv7h=('297a0c0fc86144cd5a902bc2e62ffffadf7b6c7e7d43b851ab018b05e5c138bb')

package() {
	install -Dm755 "${pkgname/-bin/}" -t "${pkgdir}/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname/-bin/}/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname/-bin/}/"

	install -Dm644 "completions/${pkgname/-bin/}.bash" -t "${pkgdir}/usr/share/bash-completion/completions/"
	install -Dm644 "completions/${pkgname/-bin/}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d/"
	install -Dm644 "completions/_${pkgname/-bin/}" -t "${pkgdir}/usr/share/zsh/site-functions/"
}
