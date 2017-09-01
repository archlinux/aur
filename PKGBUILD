_pkgname=hideIt.sh
pkgname=hideit.sh-git
pkgver=a1a05c9
pkgrel=1
pkgdesc="Automagically hide/show a window"
arch=('i686' 'x86_64')
url="https://github.com/Tadly/hideIt.sh"
license=('GPL3')
depends=('xdotool' 'xorg-xwininfo' 'xorg-xev')
provides=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/Tadly/hideIt.sh.git")
md5sums=('SKIP')


pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-parse --short HEAD
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
