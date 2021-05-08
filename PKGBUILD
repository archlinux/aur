pkgname=markdown-to-standalone-html
pkgver=0.4.1
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
sha256sums=('e2a3672cbacfef374f84717147b224d18e1fde177ae08085840463aa7f260fef')

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
