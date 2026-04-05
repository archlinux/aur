# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=proxelar-bin
_pkgname=proxelar
pkgver=0.4.1
pkgrel=2
pkgdesc='Programmable MITM proxy that intercepts HTTP/HTTPS traffic. With a TUI, terminal, and web GUI interface'
arch=('x86_64' 'aarch64')
url='https://github.com/emanuele-em/proxelar'
license=('MIT')
depends=('lua')
makedepends=('cargo')
options=(!lto !debug)
provides=('proxelar')
conflicts=('proxelar' 'proxelar-bin')
source_x86_64=("${_pkgname}-bin-${pkgver}.tar.gz::$url/releases/download/v$pkgver/proxelar-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-bin-${pkgver}.tar.gz::$url/releases/download/v$pkgver/proxelar-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
source=("LICENSE::https://raw.githubusercontent.com/emanuele-em/${_pkgname}/refs/tags/v$pkgver/LICENSE-MIT")
sha256sums=('7beed5740a54fe01210a251507d55576e32522b292af5eb9d74a4fbd5545d365')
sha256sums_x86_64=('5c1286a2ed98758eeeac8593e2fe725f5e3c931ed3c83dd49e40843e17c73d44')
sha256sums_aarch64=('aa390ba78dadb23a4d88c549f904457e353547745042c47b2f567e9c278b13df')

package() {
    install -Dm0755 proxelar "$pkgdir/usr/bin/proxelar"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

# vim: ts=4 sw=4 et:
