# Maintainer: Bolt J Woofson <bolt@boop.no>
pkgname=brum-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="Multi-Pane Web Environment (File Commander/Manager) - By Woofson (Pre-compiled standalone binary)"
arch=('x86_64')
url="https://github.com/Woofson/brum"
license=('MIT')
provides=('brum')
conflicts=('brum' 'commanderdog' 'commanderdog-bin')
depends=('glibc' 'sqlite' 'libssh2' 'openssl' 'ca-certificates')
source=("brum-v${pkgver}-linux-${arch}.tar.gz::https://github.com/Woofson/brum/releases/download/v${pkgver}/brum-v${pkgver}-linux-${arch}.tar.gz")
sha256sums=('e584df835a34e267f92cacb24a2de42f5e4094b01bfff61323eb6560f7b631a1')

package() {
    cd "$srcdir/brum-v${pkgver}-linux-${arch}"
    install -Dm755 "brum" "$pkgdir/usr/bin/brum"
    install -Dm644 "brum.service" "$pkgdir/usr/lib/systemd/system/brum.service"
    
    install -Dm644 "config.toml" "$pkgdir/etc/brum/config.toml"
    
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
