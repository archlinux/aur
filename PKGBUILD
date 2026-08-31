# Maintainer: Bolt J Woofson <bolt@boop.no>
pkgname=commanderdog-bin
pkgver=0.6.8
pkgrel=1
pkgdesc="Multi-Tab Web Commander - By Woofson (Pre-compiled standalone binary)"
arch=('x86_64')
url="https://github.com/Woofson/commanderdog"
license=('MIT')
provides=('commanderdog')
conflicts=('commanderdog')
depends=('glibc' 'sqlite' 'libssh2' 'openssl' 'ca-certificates')
source=("commanderdog-v${pkgver}-linux-${arch}.tar.gz::https://github.com/Woofson/commanderdog/releases/download/v${pkgver}/commanderdog-v${pkgver}-linux-${arch}.tar.gz")
sha256sums=('7498bcb070659c9da25c0ab786986ddf22e934d6c1ec844acfe594c10f515b6a')

package() {
    cd "$srcdir/commanderdog-v${pkgver}-linux-${arch}"
    install -Dm755 "commanderdog" "$pkgdir/usr/bin/commanderdog"
    install -Dm644 "commanderdog.service" "$pkgdir/usr/lib/systemd/system/commanderdog.service"
    
    install -Dm644 "config.toml" "$pkgdir/etc/commanderdog/config.toml"
    
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
