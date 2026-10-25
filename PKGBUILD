# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=pemdash
pkgver=0.2.1
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

sha256sums_x86_64=('627505571011bfb9c7773949e46edee28061e11825c23e16e6c2a83cb834ad53')
sha256sums_aarch64=('9be8eb7bbf0cf91b9aa43847fa687e297b99905a2850694a2e4ee6b1d7f70c85')

package() {
  install -Dm755 pemdash "$pkgdir/usr/bin/pemdash"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
