# Maintainer: Dan Milne <d@nmilne.com>

pkgname=tuber-rs-bin
_pkgname=tuber-rs
pkgver=0.14.2
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

sha256sums_x86_64=('07b08d3200fa87f259df01761d3a01d58afdc92706654f2e88d94dc38c28227e'
                   '0a4cb181cdec7e9751096fbc9e23d4203b8d735d76ac3eb7408cd0a51ff970fa')
sha256sums_aarch64=('167877e5da06f3c7ded49be3cbdad411d2620aaa0d57a51ff3fe2f606e6821e2'
                    'f53f16045c558ade13ed6d3dd7b4a5f11032684496a1171ae8fce2fcc764abac')

package() {
	install -Dm755 "$srcdir/tuber-cli" "$pkgdir/usr/bin/tuber-cli"
	install -Dm755 "$srcdir/tuber-tui" "$pkgdir/usr/bin/tuber-tui"
}
