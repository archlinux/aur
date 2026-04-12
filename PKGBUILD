# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=proxelar-bin
_pkgname=proxelar
pkgver=0.4.3
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
sha256sums_x86_64=('873877a14762a8e5e81c2db3c9c1f175b73a4b3287ddedd27affce890453eb28')
sha256sums_aarch64=('fd2b7d72a76b02004a5ba83b3a630c66e03819ea6fe4749d355291a1421ef28a')

package() {
    install -Dm0755 proxelar "$pkgdir/usr/bin/proxelar"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

# vim: ts=4 sw=4 et:
