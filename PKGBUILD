# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=budget-tracker-bin
_pkgname=budget-tracker
pkgver=1.7.0
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
sha256sums_x86_64=('1b07f4808da59b08237f7802e4f8bbc15d0c5471ef924c8d86f901e6906ab51f')
sha256sums_aarch64=('939f9699413ba6e7e8b428be2e9841e6da50e4508bf8af3d404f5c30ea4afc9d')

package() {
    cd "budget-tracker-${pkgver}-${CARCH}-unknown-linux-gnu"
    install -Dm0755 "budget-tracker" "$pkgdir/usr/bin/budget-tracker"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=4 sw=4 et:
