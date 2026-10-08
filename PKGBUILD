# Maintainer: WgpArch <wgparch@riseup.net>
pkgname=aur-security-dashboard
pkgver=1.1.5
pkgrel=1
pkgdesc="A forensic-grade, local SIEM dashboard for Arch Linux to monitor system integrity, audit AUR packages, and hunt anomalies."
arch=('any')
url="https://github.com/WgpArch/aur-security-dashboard"
license=('GPL-3.0-only')
depends=('python' 'python-gobject' 'gtk4')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WgpArch/aur-security-dashboard/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ce16b0b2da51152ce9d232804884373ced526d1b73bf1d87d902d57f6120923a')

package() {
    # Tarballs extract to "pkgname-pkgver", not just "pkgname"
    cd "$srcdir/${pkgname}-${pkgver}"
    
    install -Dm755 main.py "$pkgdir/usr/bin/aur-security-dashboard"
    install -Dm644 aur-security-dashboard.desktop "$pkgdir/usr/share/applications/aur-security-dashboard.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    cp -r docs/* "$pkgdir/usr/share/doc/$pkgname/"
}
