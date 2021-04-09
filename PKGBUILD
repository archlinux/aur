# Maintainer: ReneganRonin <renegan.ronin@gmail.com> 

pkgname=delphes
pkgver=3.4.2
pkgrel=1
pkgdesc="A framework for fast simulation of a generic collider experiment"
url="http://cp3.irmp.ucl.ac.be/projects/delphes"
arch=('i686' 'x86_64')
license=('GPL3')
provides=('delphes')
conflicts=('delphes-git')
depends=("cmake"
         "root")
source=("https://github.com/delphes/delphes/archive/${pkgver}.zip")
sha256sums=('e41ceec08e7a9299e613bcd321f1cd369e902ce7f7da74bb824a0f5261f93c39')

build() {
    cmake -DCMAKE_INSTALL_PREFIX="/usr/" delphes-${pkgver}
    make
}

package() {
    make install DESTDIR=${pkgdir}

    msg2 "Moving examples and cards"
    install -dm755 "${pkgdir}/usr/share/Delphes"
    install -dm755 ${pkgdir}/usr/examples ${pkgdir}/usr/share/Delphes/examples
    install -dm755 ${pkgdir}/usr/cards ${pkgdir}/usr/share/Delphes/cards
}

# Local Variables:
# mode: sh
# End:
