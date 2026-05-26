# Maintainer: Andrew Mello <andrew@88plug.com>
pkgname=intel-amt-activate
pkgver=0.1.0
pkgrel=1
pkgdesc="Activate Intel AMT in Client Control Mode from Linux — no MEBx, no reboot, ~40s on CSME 16.1+"
arch=('any')
url="https://github.com/88plug/amt-activate-linux"
license=('MIT')
depends=('rpc-go-bin' 'openssl' 'sudo')
optdepends=(
    'intel-amt-linux: GUI + CLI for KVM, SOL, IDER, power control after activation'
    'nmap: scan subnet for AMT IPs after activation'
)
source=("git+https://github.com/88plug/amt-activate-linux.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "$srcdir/amt-activate-linux"
    install -Dm755 scripts/amt-activate.sh "$pkgdir/usr/bin/amt-activate"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
