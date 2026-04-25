# Maintainer: stag-enterprises < x [at] stag [dot] lol >

pkgname=keybind-visualizer
_hash=ed1663acbc23423f3bf9ec551f0fb2aada467165
pkgver="r7.${_hash::8}"
pkgrel=1
pkgdesc="Interactive visualizer for keymaps"
arch=("any")
url="https://gitgud.io/uwu/keybind-visualizer"
license=("MIT")
depends=("quickshell" "sh" "qt6-declarative")
makedepends=("git")
source=("src::git+https://gitgud.io/uwu/keybind-visualizer#commit=ed1663acbc23423f3bf9ec551f0fb2aada467165"
        "launcher.sh"
        "app.desktop")
sha256sums=('82616945bea67e581939f8ef5e6df16212652a57d604792fccd138835d2bf159'
            '8df9f955e0c55ed1ac0882f67874880c9c3b09bdb46f408c7317a9bc7896323c'
            '762f3c0d4e848e05e1288003921334c03e2da63d191176951571dbccb0a8e89e')

package() {
     cd "$srcdir"
     install -Dm755 launcher.sh   "$pkgdir/usr/bin/keybind-visualizer"
     install -Dm644 app.desktop   "$pkgdir/usr/share/applications/$pkgname.desktop"
     install -Dm644 src/shell.qml "$pkgdir/usr/share/$pkgname/shell.qml"
     install -Dm644 src/LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
     install -Dm644 src/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
