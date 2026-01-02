# Maintainer: Cyb3rKo <cyb3rko-aur [ät] pm [dot] me>

pkgname=maclean-git
pkgver=r111.87d490c
pkgrel=1
pkgdesc="A script to automate some relatively safe cleaning activities for Linux users."
url="https://gitlab.com/cscs/maclean"
license=(Beerware)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
sha512sums=('SKIP')
b2sums=('SKIP')
arch=(any)
makedepends=(git)
provides=("maclean=$pkgver")
conflicts=(maclean)

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "maclean"
}
