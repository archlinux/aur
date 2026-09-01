# Maintainer: Bolt J Woofson <bolt@boop.no>
pkgname=commanderdog-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Multi-Tab Web Commander - By Woofson (Pre-compiled standalone binary)"
arch=('x86_64')
url="https://github.com/Woofson/commanderdog"
license=('MIT')
provides=('commanderdog')
conflicts=('commanderdog')
depends=('glibc' 'sqlite' 'libssh2' 'openssl' 'ca-certificates')
source=("commanderdog-v${pkgver}-linux-${arch}.tar.gz::https://github.com/Woofson/commanderdog/releases/download/v${pkgver}/commanderdog-v${pkgver}-linux-${arch}.tar.gz")
sha256sums=('41814bde9d97a8b8eab6238b6e93953500f8857826b2d44b4fa437922e23ce52')

package() {
    cd "$srcdir/commanderdog-v${pkgver}-linux-${arch}"
    install -Dm755 "commanderdog" "$pkgdir/usr/bin/commanderdog"
    install -Dm644 "commanderdog.service" "$pkgdir/usr/lib/systemd/system/commanderdog.service"
    
    install -Dm644 "config.toml" "$pkgdir/etc/commanderdog/config.toml"
    
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
