# Maintainer: taxin-404 <taxin404@duck.com>
pkgname=browsercode-bin
pkgver=0.1.20
pkgrel=1
pkgdesc="An AI coding agent that drives real browsers (opencode fork, adds browser_execute via CDP) — prebuilt binary"
arch=('x86_64' 'aarch64')
url="https://github.com/browser-use/browsercode"
license=('MIT')
# The binary statically embeds its JS runtime (libuv) and links only glibc, so
# it runs without uv; uv is useful only as the agent's Python tooling.
depends=()
optdepends=('uv: Python tooling inside the coding agent')
provides=('bcode' 'browsecode')
options=('!debug' '!strip')
install=browsercode-bin.install

source_x86_64=("bcode-linux-x64-${pkgver}.tar.gz::https://github.com/browser-use/browsercode/releases/download/v${pkgver}/bcode-linux-x64.tar.gz")
source_aarch64=("bcode-linux-arm64-${pkgver}.tar.gz::https://github.com/browser-use/browsercode/releases/download/v${pkgver}/bcode-linux-arm64.tar.gz")

sha256sums_x86_64=('af259261fb0562fc23c9996c2d7a627ca0d657c91ca1721427947d3427734b68')
sha256sums_aarch64=('4e71c6c3126c7f2e5457a2f6e1e3b030aa78aa191f5326f3e946f25959558f48')

package() {
  install -Dm755 "$srcdir/bcode" "$pkgdir/usr/bin/bcode"
}
