# Maintainer: Lutsai Aleksandr <s.lyra@ya.ru>

pkgname=mmtui-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Terminal User Interface disk mount manager for TUI file managers"
url="https://github.com/SL-RU/mmtui"
license=("MIT")
arch=("x86_64")
provides=("mmtui")
conflicts=("mmtui")
depends=("udisks2")

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/SL-RU/mmtui/releases/download/mmt-v${pkgver}/mmtui_mmt-v${pkgver}_x86_64-unknown-linux-musl.tar.gz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/SL-RU/mmtui/mmt-v${pkgver}/LICENSE"
)

sha256sums=('380583edbce1333d9a6a115ccd9244e05ffb4ef02bd502961b5a8ed2565e5967'
            '6224f824ae91817ade393e1533ec77ad981620ab6b2c35d7c079ee72fba63c02')

package() {
    install -Dm755 mmtui "$pkgdir/usr/bin/mmtui"
    install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
