# Maintainer: Jonathan Tremesaygues <killruana@gmail.com>
pkgname=graywolf-git
pkgver=0.1.6.r184.6c5e24f
pkgrel=1
epoch=
pkgdesc='An opensource placement tool'
arch=('i686' 'x86_64')
url='https://github.com/rubund/graywolf/'
license=('GPL')
provides=('graywolf')
conflicts=('graywolf')
depends=('bash' 'libx11')
makedepends=('cmake' 'gsl')
source=("git://github.com/rubund/graywolf")
sha512sums=('SKIP')
#options=('!makeflags')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "0.1.6.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make DESTDIR="${pkgdir}" install
}
