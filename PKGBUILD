# Maintainer James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=sway-dmenu-desktop
pkgver=1
pkgrel=1
pkgdesc="i3-dmenu-desktop patched for sway"
arch=('i686' 'x86_64')
url="https://github.com/choderalab/pymbar"
license=('none')
depends=('i3-wm')
source=('sway-dmenu-desktop.patch')
sha512sums=('b00cd622151dd35c303eeb666cbe0bd5b9a5a74b1f29efe69994c01cef328bcc45f8083a1b41c589fff3f891282d2d3b53634e6efbf49c8fe007414150b7a5f5')

build() {
    cp /usr/bin/i3-dmenu-desktop sway-dmenu-desktop
    patch -p0 sway-dmenu-desktop < sway-dmenu-desktop.patch
}

package() {
    cd "$srcdir"
    install -Dm 755 sway-dmenu-desktop $pkgdir/usr/bin/sway-dmenu-desktop
}
