# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=budget-tracker-bin
_pkgname=budget-tracker
pkgver=1.4.0
pkgrel=1
pkgdesc='A simple TUI budget tracker. Designed to track income and expenses and help visualize and gather basic insights from your transactions.'
arch=('x86_64')
url='https://github.com/Feromond/budget_tracker_tui'
license=('GPL-3.0')
options=(
    !lto
    !debug
    !strip
)
provides=('budget-tracker')
conflicts=('budget-tracker' 'budget-tracker-git')
source=("${_pkgname}-${pkgver}::$url/releases/download/v$pkgver/Budget_Tracker_linux"
    "LICENSE::https://raw.githubusercontent.com/Feromond/budget_tracker_tui/refs/tags/v$pkgver/LICENSE")
sha256sums=('5a49fda3b6ab0e1d79dbb83339960c4c11844cda8d7963480594bb5a21e87508'
            '721f02feaafddffe82ddf6bc01a821ee8bacb2c3ca9e6a54a81c0cd9eb21a4c7')

package() {
    install -Dm0755 "${_pkgname}-${pkgver}" "$pkgdir/usr/bin/budget-tracker"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

# vim: ts=4 sw=4 et:
