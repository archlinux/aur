# Maintainer: Adrian Valcarcel-Schott <avalsch@proton.me>

pkgname="plymouth-theme-framework-git"
pkgver=r2.b801f5b
pkgrel=1
pkgdesc="Plymouth theme with animated Framework logo"
arch=(any)
url="https://git.sr.ht/~jameskupke/framework-plymouth-theme"
license=("unknown")
depends=('plymouth')
makedepends=('git')
source=('git+https://git.sr.ht/~jameskupke/framework-plymouth-theme')
sha256sums=('SKIP')

pkgver() {
    cd "framework-plymouth-theme"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/framework-plymouth-theme/framework"
    mkdir -p "$pkgdir/usr/share/plymouth/themes/framework"
    install -Dm644 * "$pkgdir/usr/share/plymouth/themes/framework"
}
