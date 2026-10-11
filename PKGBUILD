# Maintainer: Dan Milne <d@nmilne.com>

pkgname=tuber-rs-bin
_pkgname=tuber-rs
pkgver=0.16.0
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

sha256sums_x86_64=('59ecf70e2d7d59ff345c9410e1cfbd39a2e0171f458c71a78a5a57bebfbe5254'
                   '3d1139b6f4979fd51a2d3c5e54aa7d348f62d7104ba634e7a295f2b8aaf5bf3a')
sha256sums_aarch64=('c77f453ddd7123b4f46a094e00621cfc441efd4558f235b282c41eaf312052f7'
                    '9b8a3f55ac13170294b9f1a705339766e236cdb8aeb58fd1c0de8304098c2ff8')

package() {
	install -Dm755 "$srcdir/tuber-cli" "$pkgdir/usr/bin/tuber-cli"
	install -Dm755 "$srcdir/tuber-tui" "$pkgdir/usr/bin/tuber-tui"
}
