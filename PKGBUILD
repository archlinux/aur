# Maintainer: ohixx <cegocego59@gmail.com>
pkgname=linuxpad
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple soundboard for Linux with PipeWire support"
arch=("any")
url="https://github.com/ohixx/linuxpad"
license=("GPL3")
depends=(
    "python"
    "python-pyqt6"
    "pipewire"
    "pipewire-pulse"
)
optdepends=(
    "python-pynput: Global hotkey support"
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ohixx/linuxpad/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("4c80256cce1eaa642f168166b54f547a4fbd8c020a9cac15b8d3ef44c855c631")

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 linuxpad.py "$pkgdir/usr/bin/linuxpad"
    install -Dm644 linuxpad.desktop "$pkgdir/usr/share/applications/linuxpad.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
