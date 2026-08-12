# Maintainer: taxin <taxin404@duck.com>
pkgname=browsercode-bin
pkgver=0.1.19
pkgrel=1
pkgdesc="An AI coding agent that drives real browsers (opencode fork, adds browser_execute via CDP) — prebuilt binary"
arch=('x86_64' 'aarch64')
url="https://github.com/browser-use/browsercode"
license=('MIT')
depends=('uv')
provides=('bcode' 'browsercode')
conflicts=('bcode' 'browsercode')
optdepends=('uv: required at runtime for the browser_execute tool')
options=('!debug' '!strip')
install=browsercode-bin.install

source_x86_64=("bcode-linux-x64-${pkgver}.tar.gz::https://github.com/browser-use/browsercode/releases/download/v${pkgver}/bcode-linux-x64.tar.gz")
source_aarch64=("bcode-linux-arm64-${pkgver}.tar.gz::https://github.com/browser-use/browsercode/releases/download/v${pkgver}/bcode-linux-arm64.tar.gz")

sha256sums_x86_64=('b1705ccbe7ee170b9dcf84af6d36e3c20166c80eff322793c665495a4666a459')
sha256sums_aarch64=('58cf0746ba34b5bd3c6db00b832400db65c4275f2b67c57c36d450ef7b647998')

package() {
  install -Dm755 "$srcdir/bcode" "$pkgdir/usr/bin/bcode"
}
