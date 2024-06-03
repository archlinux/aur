# Maintainer: wins1ey <wins1ey at wins1ey dot win>
pkgname=libresplit-git
_pkgname=libresplit
pkgver=r412.28ef2afa6
pkgrel=1
pkgdesc="Free speedrun timer with auto splitting and load removal."
arch=('x86_64')
url='https://github.com/wins1ey/LibreSplit'
license=('GPL3')
depends=(
    'gtk3'
    'jansson'
    'luajit'
)
makedepends=(
    'git'
    'xxd'
)

source=("$_pkgname::git+https://github.com/wins1ey/LibreSplit.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=9 HEAD)"
}

build() {
    cd $_pkgname
    make
}

package() {
    cd $_pkgname
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
