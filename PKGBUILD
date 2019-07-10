_pkgname=hideIt.sh
pkgname=hideit.sh-git
pkgver=r43.b99d6b4
pkgrel=2
pkgdesc="Automagically hide/show a window"
arch=('i686' 'x86_64')
url="https://github.com/tadly/hideIt.sh"
license=('GPL3')
depends=('xdotool' 'xorg-xwininfo' 'xorg-xev')
makedepends=('git')
provides=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/tadly/hideIt.sh.git")
sha256sums=('SKIP')


pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
