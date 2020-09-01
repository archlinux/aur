pkgname=akava-colors-git
_pkgname=Akava-Colors
pkgver=r10.9a49c6f
pkgrel=1
pkgdesc="Akava KDE/Qt colors"
arch=(any)
url="https://github.com/Akava-Design/$_pkgname"
license=('GPL3')
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_akava-colors-git() {
    provides=('akava-colors')

    cd $_pkgname
    install -d "${pkgdir}/usr/share"
    mkdir -p "${pkgdir}/usr/share/color-schemes"
    cp -r Akava.colors "${pkgdir}/usr/share/color-schemes"
}
