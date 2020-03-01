# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=dnote-cli-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="A simple command line notebook for programmers"
arch=('x86_64')
url="https://www.getdnote.com/"
license=('GPL3')
provides=('dnote-cli')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dnote/dnote/releases/download/cli-v${pkgver}/dnote_${pkgver}_linux_amd64.tar.gz")
md5sums=('23c30e6927607d58f7fce02cf61f9077')

package() {
	cd "$srcdir"
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 755 dnote "${pkgdir}/usr/bin/"
	install -Dm644 GPLv3.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}