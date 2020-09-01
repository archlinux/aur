pkgname=akava-konsole-git
_pkgname=Akava-Konsole
pkgver=r3.56824cc
pkgrel=1
pkgdesc="Akava konsole colors"
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

package_akava-konsole-git() {
    provides=('akava-konsole')

    cd $_pkgname
    install -d "${pkgdir}/usr/share"
    mkdir -p "${pkgdir}/usr/share/konsole"
    cp -r Akava.colorscheme "${pkgdir}/usr/share/konsole"
}
