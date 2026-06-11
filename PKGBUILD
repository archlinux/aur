# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=proxelar-bin
_pkgname=proxelar
pkgver=0.4.6
pkgrel=1
pkgdesc='Programmable MITM proxy that intercepts HTTP/HTTPS traffic. With a TUI, terminal, and web GUI interface'
arch=('x86_64' 'aarch64')
url='https://github.com/emanuele-em/proxelar'
license=('MIT')
depends=('lua')
makedepends=('cargo')
options=(!lto !debug)
provides=('proxelar')
conflicts=('proxelar-git' 'proxelar')
source_x86_64=("${_pkgname}-bin-${pkgver}.tar.gz::$url/releases/download/v$pkgver/proxelar-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-bin-${pkgver}.tar.gz::$url/releases/download/v$pkgver/proxelar-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
source=("LICENSE::https://raw.githubusercontent.com/emanuele-em/${_pkgname}/refs/tags/v$pkgver/LICENSE-MIT")
sha256sums=('7beed5740a54fe01210a251507d55576e32522b292af5eb9d74a4fbd5545d365')
sha256sums_x86_64=('ff60807c97bf36bd22718c1d1be522c1f8282fd3196f04d7b38aa6057ab867d6')
sha256sums_aarch64=('7139e4b2dcd71a0df2e9e4a0cab9959a51f49a0f3ff27acc68b3ef5ea2710afb')

package() {
    install -Dm0755 proxelar "$pkgdir/usr/bin/proxelar"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

# vim: ts=4 sw=4 et:
