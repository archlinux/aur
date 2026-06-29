# Maintainer: taxin <unknownbrofrombd@duck.com>
pkgname=browsercode-bin
pkgver=0.1.13
pkgrel=1
pkgdesc="An AI coding agent that drives real browsers (opencode fork, adds browser_execute via CDP) — prebuilt binary"
arch=('x86_64' 'aarch64')
url="https://github.com/browser-use/browsercode"
license=('MIT')
provides=('bcode' 'browsercode')
conflicts=('bcode' 'browsercode')
optdepends=('uv: required at runtime for the browser_execute tool')
options=('!debug' '!strip')
install=browsercode-bin.install

source_x86_64=("bcode-linux-x64-${pkgver}.tar.gz::https://github.com/browser-use/browsercode/releases/download/v${pkgver}/bcode-linux-x64.tar.gz")
source_aarch64=("bcode-linux-arm64-${pkgver}.tar.gz::https://github.com/browser-use/browsercode/releases/download/v${pkgver}/bcode-linux-arm64.tar.gz")

sha256sums_x86_64=('c5213da42a8c56d4071fdc6333a815ad8c6439311cb878c0b84c4311e7a68f21')
sha256sums_aarch64=('bb06c6d5ab61fa29a15f2b907844fc02f2f3948c181abd3b30350b8387e3ca1b')

package() {
  install -Dm755 "$srcdir/bcode" "$pkgdir/usr/bin/bcode"
}
