pkgname="vast-astronomical-git"
_pkgname="vast"
pkgver=r2.d647a85
pkgrel=1
pkgdesc="VaST is a software tool for finding variable objects on a series of astronomical images"
arch=("x86_64")
url='http://scan.sai.msu.ru/vast'
license=('GPL3')
makedepends=('git' 'bc' 'gcc-fortran')
source=("$pkgname::git+https://github.com/kirxkirx/vast.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_base}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/${pkgname}"
    make
}

package() {
    install -Dm755 "${srcdir}/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
