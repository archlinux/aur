pkgname=markdown-to-standalone-html
pkgver=0.4.3
pkgrel=1
pkgdesc="Create a standalone HTML file from Markdown with basic CSS, table of contents and source code highlighting"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/EdJoPaTo/markdown-to-standalone-html"
license=('MIT')
depends=()
makedepends=('cargo')
optdepends=('monolith: inline assets like images or CSS')
provides=("markdown-to-standalone-html")
conflicts=("markdown-to-standalone-html")

source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('4f977febc28558f913cab7f4971be14a2d9c442f89a5e0778b9e4f1d2a80967c')

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

package() {
  cd $pkgname-$pkgver
  install -Dm 755 target/release/$pkgname -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
