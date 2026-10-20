# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=cc-clip-bin
_pkgname=cc-clip
pkgver=0.13.1
pkgrel=2
pkgdesc="Clipboard bridge for pasting images into AI coding agents over SSH (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/ShunmeiCho/cc-clip"
license=('MIT')
depends=('openssh')
optdepends=('xclip: X11 clipboard support'
            'wl-clipboard: Wayland clipboard support'
            'xorg-server-xvfb: Codex CLI clipboard support on remote hosts')
provides=('cc-clip')
conflicts=('cc-clip')
options=('!strip' '!debug')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/ShunmeiCho/$_pkgname/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/ShunmeiCho/$_pkgname/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a37952e0d87a52b5043979fa91abab3451478ff37eb142f5f8b4911c5ac39f11')
sha256sums_aarch64=('46371df78d9ebf9bd4f0711eb59eac291402c02809f23d7ae2e76eb78e83160e')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
