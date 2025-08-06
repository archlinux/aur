# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=deltatune-linux
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="DeltaTune ported to Linux. Show the currently playing song like the 'Field of Hopes and Dreams' pop-up from Deltarune Chapter 1."
arch=('any')
url="https://github.com/ThatOneCalculator/deltatune-linux"
license=('MIT')
groups=()
depends=(quickshell playerctl)
provides=(deltatune)
backup=()
options=()
source=("https://github.com/ThatOneCalculator/deltatune-linux/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')
validpgpkeys=()

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 deltatune "$pkgdir/usr/bin/deltatune"
    
    install -Dm644 shell.qml "$pkgdir/etc/xdg/quickshell/deltatune/shell.qml"
    
    install -dm755 "$pkgdir/etc/xdg/quickshell/deltatune/fonts"
    install -m644 fonts/*.png "$pkgdir/etc/xdg/quickshell/deltatune/fonts/"
    install -m644 fonts/*.js "$pkgdir/etc/xdg/quickshell/deltatune/fonts/"
}
