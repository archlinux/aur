# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=pemdash
pkgver=0.2.0
pkgrel=1
pkgdesc="Fast GTK calculator overlay with proper operator precedence"
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/pemdash"
license=('MIT')
depends=('gcc-libs' 'gtk4')
optdepends=('wl-clipboard: persistent clipboard copying on Wayland'
            'xclip: persistent clipboard copying on X11')
makedepends=()
options=('!strip' '!debug' '!lto')

source_x86_64=("$pkgname-$pkgver-$pkgrel-x86_64.tar.gz::$url/releases/download/v$pkgver/pemdash-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-$pkgrel-aarch64.tar.gz::$url/releases/download/v$pkgver/pemdash-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('25b734d028b9624a810cf7d053f4863f077d037f740d07f7af32ba12b472bbbf')
sha256sums_aarch64=('e27c6af580f08156a28567cb97e5dfde0b8a1c5a4604e92a338474dc27236fcf')

package() {
  install -Dm755 pemdash "$pkgdir/usr/bin/pemdash"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
