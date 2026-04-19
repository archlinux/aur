# Maintainer: gigas002 <gigas002@pm.me>

pkgname=sweet-sddm-git
_pkgname=Sweet-kde
pkgver=r47.2ed3782
pkgrel=1
pkgdesc="Sweet KDE SDDM login theme"
arch=('any')
url="https://github.com/Gigas002/$_pkgname"
license=('GPL-3.0-or-later')
makedepends=(
    'git'
)
depends=(
    'sddm'
)
provides=('sweet-sddm')
conflicts=('sweet-sddm')
source=("$_pkgname::git+$url.git#branch=plasma-6-migration")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    install -dm755 "$pkgdir/usr/share"
    cp -r "$srcdir/$_pkgname/sddm" "$pkgdir/usr/share/"
}
