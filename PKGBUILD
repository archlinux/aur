# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=compton-old-git
pkgver=r437.1765c9d
pkgrel=1
pkgdesc='Old version of compton, before the picom fork, avoids some regressions'
arch=('x86_64' 'i686')
url='https://github.com/chjj/compton'
license=('MIT')
makedepends=('git' 'asciidoc')
conflicts=(compton)
provides=(compton)
source=('git+https://github.com/sandsmark/compton.git')
md5sums=('SKIP')

pkgver() {
    cd compton
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd compton
    make
}

package() {
    cd compton
    make DESTDIR="$pkgdir" install
}
