# Maintainer: Jacob Meyers <jeyersdev@gmail.com>
pkgname=foxchat-server
pkgver=2026
pkgrel=5.8
pkggitver=v5.8.2026
pkgdesc="Simple server used for FoxChat."
arch=('x86_64')
url="https://jd.pnc3.net/software/foxchat"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'gcc' 'make')
source=("https://github.com/Jacob-Meyers/FoxChat-FOSS/releases/download/$pkggitver/foxchat-server.tar.gz")
sha256sums=('6368e8d3bb736ad6e59047d85d1ac87345b003f2bdabe2e7012b920877bbef7d')

package() {
    install -Dm755 "$srcdir/foxchat-server" "$pkgdir/usr/bin/foxchat-server"

    install -d "$pkgdir/usr/share/licenses/$pkgname"

    cp -r "$srcdir/server_licenses/." "$pkgdir/usr/share/licenses/$pkgname/"

    find "$pkgdir/usr/share/licenses/$pkgname" -type f -exec chmod 644 {} +
}