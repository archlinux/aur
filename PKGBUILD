# Maintainer: Jonathan Tremesaygues <killruana@slaanesh.org>
pkgname=qrouter-git
pkgver=1.4.r257.3c74097
pkgrel=1
epoch=
pkgdesc='Multi-level, over-the-cell maze router'
arch=('i686' 'x86_64')
provides=('qrouter')
conflicts=('qrouter')
url='http://opencircuitdesign.com/qrouter/'
license=('GPL')
depends=('tk')
source=("git://opencircuitdesign.com/qrouter#branch=qrouter-1.4")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "1.4.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    cd "${srcdir}/${pkgname%-git}"
    ./configure \
        --prefix=/usr 
    make
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make DESTDIR="${pkgdir}" install
}

