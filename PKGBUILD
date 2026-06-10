# Maintainer: adelmonte
pkgname=arch-native-client
pkgver=1.3.2
pkgrel=1
pkgdesc="Client-side tools for arch-native: package list sync and repo upgrade helper"
arch=('any')
url="https://github.com/adelmonte/arch-native"
license=('GPL-3.0-or-later')
depends=('rsync' 'pacman' 'python')
install=arch-native-client.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/adelmonte/arch-native/archive/refs/tags/arch-native-client-v${pkgver}.tar.gz")
sha256sums=('37e7c56f81f769c10e3ffab268f14fe3b8a2119f595f6baa04396d78863f4fa2')

package() {
    cd "$srcdir/arch-native-arch-native-client-v${pkgver}/arch-native-client"

    install -Dm755 pkglist-export \
        "$pkgdir/usr/bin/pkglist-export"
    install -Dm644 pkglist-export.hook \
        "$pkgdir/usr/share/libalpm/hooks/pkglist-export.hook"
    install -Dm755 native-sync \
        "$pkgdir/usr/bin/native-sync"
    install -Dm644 arch-native-client.conf.example \
        "$pkgdir/usr/share/arch-native-client/arch-native-client.conf.example"
    install -Dm644 ../LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
