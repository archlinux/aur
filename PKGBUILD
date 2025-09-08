# Maintainer: enova
_pkgname="plymouth-blahaj"
pkgname="plymouth-blahaj-git"
pkgver=r5.ca3eebd
pkgrel=1
pkgdesc="Plymouth theme with animated spinning blåhaj"
arch=(any)
url="https://github.com/190n/plymouth-blahaj"
license=("unknown")
depends=('plymouth')
makedepends=('git')
source=('git+https://github.com/190n/plymouth-blahaj')
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname/blåhaj"
    mkdir -p "$pkgdir/usr/share/plymouth/themes/blåhaj"
    install -Dm644 * "$pkgdir/usr/share/plymouth/themes/blåhaj"
}
