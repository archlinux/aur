# Maintainer: Alexander Fasching <fasching.a91@gmail.com>

pkgname=dwarview-git
_gitname=dwarview
pkgver=r26.79c4132
pkgrel=1
pkgdesc="GUI program that displays DWARF debug info of a file"
arch=('i686' 'x86_64')
url="https://github.com/namhyung/dwarview.git"
license=('GPL')
depends=('libelf' 'gtk3')
source=(git+https://github.com/namhyung/dwarview.git)
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_gitname}"
    make
}

package() {
    cd "${srcdir}/${_gitname}"
	install -Dm755 dwarview "${pkgdir}/usr/bin/dwarview"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
}
