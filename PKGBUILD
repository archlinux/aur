# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=cc-clip-bin
_pkgname=cc-clip
pkgver=0.9.1
pkgrel=1
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
options=('!strip')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/ShunmeiCho/$_pkgname/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/ShunmeiCho/$_pkgname/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c1293ce38dd8b5e493d0a100311611f0cad758d04851d059245ce827557d8bd9')
sha256sums_aarch64=('23d7177504a8373f37802dafe8bb0343ac2b686d75958cf23a02ab7ddaca7466')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
