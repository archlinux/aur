# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=budget-tracker-bin
_pkgname=budget-tracker
pkgver=1.4.1
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
source=(
    "${_pkgname}-${pkgver}::$url/releases/download/v$pkgver/Budget_Tracker_linux"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Feromond/budget_tracker_tui/refs/tags/v$pkgver/LICENSE"
)
sha256sums=(
    '306cd0c01145d2d4cef66eab9243ad80836986fbdc5e69cb327f63bf6a27e48b'
    'f1c01c4c194067e4cafc9a3be08cc2ff05628a7369c31bda4d0913e266287a4d'
)

package() {
    install -Dm0755 "${_pkgname}-${pkgver}" "$pkgdir/usr/bin/budget-tracker"
    install -Dm644 LICENSE-"${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=4 sw=4 et:
