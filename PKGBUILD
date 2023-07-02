# Maintainer: Your Name <youremail@domain.com>
pkgname=turbopilot-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="an open source large-language-model based code completion engine that runs locally on CPU"
arch=(x86_64)
url="https://github.com/ravenscroftj/turbopilot/"
license=('BSD')
provides=(codegen-serve codegen codegen-quantize)
source=("$pkgname-$pkgver.zip::https://github.com/ravenscroftj/turbopilot/releases/download/v${pkgver}/turbopilot-Linux-X64-avx2-openblas.zip"
	"https://raw.githubusercontent.com/ravenscroftj/turbopilot/92b65229b9821bd233679f464b27a2faa4a43e03/LICENSE.md")
sha256sums=('695902d9271b0350001bf1f80e13c44ec08223ae2b8bbc3b2b3eac94507a86d3'
	'ad440eed5aebf40261f955c276a71f63f384c54ab929ea32ce49a42f59385e17')

package() {
	find . -type f -executable -exec install -Dm755 {} -t $pkgdir/usr/bin/ \;
	install -Dm644 LICENSE* -t $pkgdir/usr/share/licenses/$pkgname/
}
