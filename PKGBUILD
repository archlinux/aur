# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=purple-bin
_pkgname=purple
pkgver=2.45.2
pkgrel=1
pkgdesc='Terminal SSH manager and SSH config editor in Rust. Fuzzy search hundreds of hosts, sync from 16 clouds, transfer files, manage Docker and Podman over SSH' 
arch=('x86_64' 'aarch64')
url='https://github.com/erickochen/purple'
license=('MIT')
depends=('openssh')
options=(!debug)
provides=('purple')
conflicts=('purple-git' 'purple')
source=("LICENSE::https://raw.githubusercontent.com/erickochen/purple/refs/tags/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('7ffe3e49f530418a8e37f4546534f20ddbd1109a5a3e3b2ae7fde09d27dae1dc')
sha256sums_x86_64=('a62cd2a9b13518a69891f7a867a7e78cf51c8bdd962364dfc67b23393a103c3b')
sha256sums_aarch64=('1697fb84674173baee435ad6e473176356ec882ce1c4f530d65772a26f07fd5a')

package() {
    install -Dm0755 -t ${pkgdir}/usr/bin 'purple'
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

# vim: ts=4 sw=4 et:
