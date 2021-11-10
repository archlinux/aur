# Maintainer: Fox Kiester <noct[at]openmailbox[dot]org>

pkgname=tdrop
pkgver=0.4.0
pkgrel=1

pkgdesc="A WM-Independent dropdown window and terminal creator"
arch=('any')
url="https://github.com/noctuid/tdrop"
license=('Simplified BSD')

depends=('bash' 'xdotool' 'xorg-xwininfo' 'xorg-xprop')
optdepends=('tmux: session starting support'
            'tmuxinator: session starting support'
            'sxhkd: for a tdrop keybinding'
            'xorg-xrandr: multiple monitor resizing support')

source=("https://github.com/noctuid/tdrop/archive/refs/tags/$pkgver.zip")
sha256sums=('f0cef46ac37703a8fabd5df1133038912206f1319b7c9d70fe7e5ac7b0b9100d')

package() {
    make -C "$pkgname-$pkgver" \
        PREFIX=/usr \
        DESTDIR="$pkgdir" \
        install
}
