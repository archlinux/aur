# Maintainer: WgpArch <wgparch@riseup.net>
pkgname=aur-security-dashboard
pkgver=1.0.0
pkgrel=1
pkgdesc="A forensic-grade, local SIEM dashboard for Arch Linux to monitor system integrity, audit AUR packages, and hunt anomalies."
arch=('any')
url="https://github.com/WgpArch/aur-security-dashboard"
license=('GPL-3.0-only')
depends=('python' 'python-gobject' 'gtk4')
makedepends=('git')
# Use local file:// protocol to bypass GitHub password prompt!
source=("git+https://gitlab.com/WgpArch/aur-security-dashboard.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 main.py "$pkgdir/usr/bin/aur-security-dashboard"
    install -Dm644 aur-security-dashboard.desktop "$pkgdir/usr/share/applications/aur-security-dashboard.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    cp -r docs/* "$pkgdir/usr/share/doc/$pkgname/"
}
