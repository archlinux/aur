# Maintainer: Arunachalam <https://aur.archlinux.org/account/arunachalam>

pkgname=aur-sentry
pkgver=1.0.0
pkgrel=1
pkgdesc="First AI-based pacman security agent and animated cyber visualizer for Arch Linux"
arch=('any')
url="https://github.com/Arunachalam-gojosaturo/aur-sentry"
license=('MIT')
depends=('bash' 'curl' 'jq' 'pacman')
optdepends=(
    'libnotify: Desktop threat notifications'
)
install=aur-sentry.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cd2e5013dedff7e6e4d17519f90a78800ffc4d372275a70f8c9483685b788775')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install core executables to /usr/bin
    install -dm755 "$pkgdir/usr/bin"
    install -m755 aur-sentry "$pkgdir/usr/bin/aur-sentry"
    install -m755 arcxos-dl "$pkgdir/usr/bin/arcxos-dl"
    install -m755 arcxos-hyper-dl "$pkgdir/usr/bin/arcxos-hyper-dl"
    install -m755 hyperdl.sh "$pkgdir/usr/bin/hyperdl.sh"

    # Install license
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation and example configuration
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -m644 banner.jpeg "$pkgdir/usr/share/doc/$pkgname/banner.jpeg"
    install -m644 pacman.conf "$pkgdir/usr/share/doc/$pkgname/pacman.conf.example"
}
