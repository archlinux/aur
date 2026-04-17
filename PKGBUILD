# Maintainer: adelmonte <qweewqaz@gmail.com>
pkgname=arch-native-client
pkgver=1.0.0
pkgrel=1
pkgdesc="Client-side pacman hook for arch-native: syncs installed package list to the build server"
arch=('any')
url="https://github.com/adelmonte/arch-native"
license=('GPL-3.0-or-later')
depends=('rsync' 'pacman' 'python')
install=arch-native-client.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/adelmonte/arch-native/archive/refs/tags/arch-native-client-v${pkgver}.tar.gz")
sha256sums=('24fbd629283cc9d1eb9aa7357b9747875fed36cd6e1cd8fb4b1d714e433467f9')

package() {
    cd "$srcdir/arch-native-arch-native-client-v${pkgver}/arch-native-client"

    install -Dm755 pkglist-export \
        "$pkgdir/usr/bin/pkglist-export"
    install -Dm644 pkglist-export.hook \
        "$pkgdir/usr/share/libalpm/hooks/pkglist-export.hook"
    install -Dm644 arch-native-client.conf.example \
        "$pkgdir/usr/share/arch-native-client/arch-native-client.conf.example"
    install -Dm644 ../LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
