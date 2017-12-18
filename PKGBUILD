# Maintainer: Jonathan Toledo <kry0ster@gmail.com>

pkgname=jumpapp-git
pkgver=r64.9356ca0
pkgrel=1
pkgdesc="A run-or-raise application switcher for any X11 desktop"
arch=('i686' 'x86_64')
url="https://github.com/mkropat/jumpapp"
license=('MIT')
depends=('wmctrl')
makedepends=('git')
provides=('jumpapp','jumpappify-desktop-entry')

source=("$pkgname"::'git+https://github.com/mkropat/jumpapp')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 jumpapp ${pkgdir}/usr/bin/jumpapp
    install -Dm755 jumpappify-desktop-entry ${pkgdir}/usr/bin/jumpappify-desktop-entry
}
