# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=proxelar-bin
_pkgname=proxelar
pkgver=0.7.0
pkgrel=1
pkgdesc='Programmable MITM proxy that intercepts HTTP/HTTPS traffic. With a TUI, terminal, and web GUI interface'
arch=(
    'x86_64'
    'aarch64'
)
url='https://github.com/emanuele-em/proxelar'
license=('MIT')
depends=('lua')
options=(
    '!lto'
    '!debug'
    '!strip'
)
provides=('proxelar')
conflicts=('proxelar-git' 'proxelar')
source_x86_64=("${_pkgname}-bin-${pkgver}.tar.gz::$url/releases/download/v$pkgver/proxelar-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-bin-${pkgver}.tar.gz::$url/releases/download/v$pkgver/proxelar-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
source=("LICENSE::https://raw.githubusercontent.com/emanuele-em/${_pkgname}/refs/tags/v$pkgver/LICENSE-MIT")
sha256sums=('7beed5740a54fe01210a251507d55576e32522b292af5eb9d74a4fbd5545d365')
sha256sums_x86_64=('879214e59c4f153a0dce770ac27cb5f62990b03935f3b90d397b2104acd9d2ea')
sha256sums_aarch64=('e0bb428a4f13110edc55add0fe2559cc77cb25466bc7c1516e735597a2de5768')

package() {
    install -Dm0755 proxelar "$pkgdir/usr/bin/proxelar"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

# vim: ts=4 sw=4 et:
