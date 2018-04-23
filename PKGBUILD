# Maintainer: Dylan Araps <dyl@tfwno.gf>
pkgname=saur-git
_pkgname=saur
pkgver=r51.29a81c5
pkgrel=1
pkgdesc="Simple AUR Helper"
arch=('any')
url="https://github.com/dylanaraps/saur"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
depends=(
    'bash'
    'git'
    'curl'
    'pacman'
)
optdepends=(
)
makedepends=('git')
source=("$pkgname::git+https://github.com/dylanaraps/saur.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/man"
    install -D -m755 "saur"   "${pkgdir}/usr/bin/$_pkgname"
    install -D -m644 "saur.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
