# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=budget-tracker-bin
_pkgname=budget-tracker
pkgver=1.6.1
pkgrel=1
pkgdesc='A simple TUI budget tracker. Designed to track income and expenses and help visualize and gather basic insights from your transactions.'
arch=(
    'x86_64'
    'aarch64'
)
url='https://github.com/Feromond/budget-tracker-tui'
license=('GPL-3.0')
options=(
    !lto
    !debug
    !strip
)
provides=('budget-tracker')
conflicts=('budget-tracker' 'budget-tracker-git')
source_x86_64=("${_pkgname}-${pkgver}-bin.tar.gz::$url/releases/download/v$pkgver/budget-tracker-1.6.1-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-bin.tar.gz::$url/releases/download/v$pkgver/budget-tracker-1.6.1-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('15056c047d03a4fb381bc92c902cf376b0236a4b2d13ee82cc247754d8a3a88a')
sha256sums_aarch64=('08654471fe907ca51b27d20fcf051831d73802f761d0d03ac6fecf0d1d38874a')

package() {
    cd "budget-tracker-${pkgver}-${CARCH}-unknown-linux-gnu"
    install -Dm0755 "budget-tracker" "$pkgdir/usr/bin/budget-tracker"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=4 sw=4 et:
