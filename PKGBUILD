# Maintainer: Kaushik Kalesh <kaushikkalesh@gmail.com>

pkgname=alwo
pkgver=1.0.0
pkgrel=1
pkgdesc="An application launcher and workspace organizer"
arch=('any')
url="https://github.com/kaushik-kalesh/alwo-linux"
license=('MIT')
depends=('python' 'wmctrl')
makedepends=()
source=('alwo-1.0.0.tar.xz')
sha256sums=('9c6fb29632ff76a0f992b0994144198c4e4382b233b16815ed2b169d0c2c84d6')

package() {
    bsdtar -xvf "$srcdir/alwo-1.0.0.tar.xz" -C "$srcdir"
    
    install -Dm755 "$srcdir/alwo" "$pkgdir/usr/bin/alwo"
    mkdir -p "$pkgdir/usr/share/alwo"
    install -Dm755 "$srcdir/config" "$pkgdir/usr/share/alwo/config"
    mkdir -p "$pkgdir/usr/share/licenses/alwo"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/alwo/LICENSE"
}
