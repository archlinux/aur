# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=dnote-cli-bin
pkgver=0.11.1
pkgrel=1
pkgdesc="A simple command line notebook for programmers"
arch=('x86_64')
url="https://www.getdnote.com/"
license=('GPL-3.0')
provides=('dnote-cli')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dnote/dnote/releases/download/cli-v${pkgver}/dnote_${pkgver}_linux_amd64.tar.gz")
sha256sums=('ed3859583e47ca62dd8c5cb75f3483b0f7c865213544a7f78e3b323d5618af23')

package() {
	install -Dm755 "$srcdir/dnote" -t "${pkgdir}/usr/bin/"
	install -dm755 "$pkgdir/usr/share/licenses/dnote-cli"
	install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
	ln -s /usr/share/licenses/common/GPL3/license.txt "$pkgdir/usr/share/licenses/dnote-cli/LICENSE"
}