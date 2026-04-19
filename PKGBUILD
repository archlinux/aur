# Maintainer: gigas002 <gigas002@pm.me>

pkgname=sweet-kvantum-git
_pkgname=Sweet-kde
pkgver=r50.0feee61
pkgrel=1
pkgdesc="Sweet KDE Plasma theme"
arch=('any')
url="https://github.com/Gigas002/$_pkgname"
license=('GPL-3.0-or-later')
makedepends=(
    'git'
)
depends=(
    'kvantum'
)
provides=('sweet-kvantum')
conflicts=('sweet-kvantum')
source=("$_pkgname::git+$url.git#branch=plasma-6-migration")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    install -dm755 "$pkgdir/usr/share"
    cp -a "$srcdir/$_pkgname/Kvantum" "$pkgdir/usr/share/Kvantum"
}
