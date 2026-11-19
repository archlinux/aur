# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=budget-tracker-bin
_pkgname=budget-tracker
pkgver=1.8.1
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
source_x86_64=("${_pkgname}-${pkgver}-bin.tar.gz::$url/releases/download/v$pkgver/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-bin.tar.gz::$url/releases/download/v$pkgver/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('7d25a54e4ca54835b87fb9bb26a490506fcc4e69e9029326efce01d41205cc0a')
sha256sums_aarch64=('81f188ff40314374faeecc0baf3057f6c16a3e20a04b5b0537dd61e2330ec0be')

package() {
    cd "budget-tracker-${pkgver}-${CARCH}-unknown-linux-gnu"
    install -Dm0755 "budget-tracker" "$pkgdir/usr/bin/budget-tracker"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=4 sw=4 et:
