# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=classfi-bin
_pkgname=classfi
pkgver=0.2.1
pkgrel=1
pkgdesc='A simple classical music player'
arch=('x86_64')
url='https://github.com/carmiac/classfi'
license=('GPL-3.0')
depends=('mpv')
options=(
    !debug
    !lto
)
provides=('classfi')
conflicts=('classfi' 'classfi-git')
source=(
    "$_pkgname-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/classfi-x86_64-unknown-linux-gnu.tar.gz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/carmiac/classfi/refs/tags/v$pkgver/LICENSE"
)
sha256sums=(
    '7a35d4022d35c1ae35bdbe85e98f18672eca079876c71659c964c09724df03ed'
    '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)

package() {
    install -Dm0755 classfi "$pkgdir/usr/bin/classfi"
    install -Dm644 LICENSE-"${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=4 sw=4 et:
