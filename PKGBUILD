# Maintainer: Dan Milne <d@nmilne.com>

pkgname=tuber-rs-bin
_pkgname=tuber-rs
pkgver=0.17.0
pkgrel=1
pkgdesc="CLI and TUI to view and manage Tuber and Beanstalkd queues (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/tuberq/tuber-rs"
license=('MIT')
provides=("tuber-cli=$pkgver" "tuber-tui=$pkgver")
conflicts=('tuber-cli' 'tuber-tui')
options=('!strip' '!debug')

# NOTE: upstream ships no LICENSE file and sets no `license` field in any
# Cargo.toml, so there is nothing to install under /usr/share/licenses. Add a
# LICENSE to the repo and this should fetch it from the tag, as tuber-bin does.

source_x86_64=("tuber-cli-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/tuber-cli-x86_64-unknown-linux-musl.tar.gz"
               "tuber-tui-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/tuber-tui-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("tuber-cli-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/tuber-cli-aarch64-unknown-linux-musl.tar.gz"
                "tuber-tui-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/tuber-tui-aarch64-unknown-linux-musl.tar.gz")

sha256sums_x86_64=('0efe6611193952008cf9363309bea7602c5c568b06f502987557d30d488ed798'
                   'c261a3c690e990b940a21c1fac4d7c8af2665e024396cb8695d996b2d59a14b1')
sha256sums_aarch64=('c690c0cc6a0d971fa5f44b54a4a277527a0ca8e4af6d8f4dcb8c0e4f69527dfc'
                    'ec662e57c471312dfecbe1d8eeab7a5ffcf6fed557a745431417b1a43a88253b')

package() {
	install -Dm755 "$srcdir/tuber-cli" "$pkgdir/usr/bin/tuber-cli"
	install -Dm755 "$srcdir/tuber-tui" "$pkgdir/usr/bin/tuber-tui"
}
