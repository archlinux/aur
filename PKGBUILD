# Maintainer: Clément Hamada <clementhamada@protonmail.com>
pkgname=menu-qalc-wayland-git
pkgver=1.5.0
pkgrel=1
pkgdesc="A calculator for Wofi/fuzzel/dmenu(2) using libqalculate"
arch=('any')
url="https://github.com/ClemaX/menu-qalc-wayland"
license=('MIT')
depends=('libqalculate' 'xclip')
makedepends=('git')
conflicts=('menu-calc' 'menu-qalc')
optdepends=('dmenu' 'wofi' 'fuzzel')
source=("git+https://github.com/ClemaX/menu-qalc-wayland.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/${pkgname%-git}"
    mkdir -p "$pkgdir/usr/bin"
    install -D -m755 ./= "$pkgdir/usr/bin/="
    mkdir -p "$pkgdir/usr/share/man/man1"
    install -D -m644 ./=.1 "$pkgdir/usr/share/man/man1/=.1"
    install -D -m644 ./menu-qalc.1 "$pkgdir/usr/share/man/man1/menu-qalc.1"
}
