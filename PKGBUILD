# Maintainer: Jesper Jensen <jesper at slashwin dot dk> 

_pkgname=neocomp
pkgname=${_pkgname}-git
pkgver=697
pkgrel=1
pkgdesc='A fast free standalone X11 compositor'
arch=('i686' 'x86_64')
url="https://github.com/delusionallogic/${_pkgname}"
license=('GPL')
depends=('mesa')
makedepends=(
    'asciidoc'
    'git'
    'libx11'
    'libxcomposite>=0.2'
    'libxdamage'
    'libxinerama'
    'libxext'
    'libxrender'
    'libxrandr'
    'libxfixes'
    'libconfig'
    'freetype2'
    'judy'
)
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/delusionallogic/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir/" gen
    make DESTDIR="$pkgdir/"
}

check() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir/" test
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir/" install
}
