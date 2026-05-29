# Maintainer: adelmonte
pkgname=arch-native-client
pkgver=1.2.0
pkgrel=1
pkgdesc="Client-side tools for arch-native: package list sync and forge upgrade helper"
arch=('any')
url="https://github.com/adelmonte/arch-native"
license=('GPL-3.0-or-later')
depends=('rsync' 'pacman' 'python')
install=arch-native-client.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/adelmonte/arch-native/archive/refs/tags/arch-native-client-v${pkgver}.tar.gz")
sha256sums=('b0810fec85b07021bb5987f45db16df20259fa8504eca2edcde21fd04427f5ac')

package() {
    cd "$srcdir/arch-native-arch-native-client-v${pkgver}/arch-native-client"

    install -Dm755 pkglist-export \
        "$pkgdir/usr/bin/pkglist-export"
    install -Dm644 pkglist-export.hook \
        "$pkgdir/usr/share/libalpm/hooks/pkglist-export.hook"
    install -Dm755 forge-sync \
        "$pkgdir/usr/bin/forge-sync"
    install -Dm644 arch-native-client.conf.example \
        "$pkgdir/usr/share/arch-native-client/arch-native-client.conf.example"
    install -Dm644 ../LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
