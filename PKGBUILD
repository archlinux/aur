# Maintainer: killruana <killruana@gmail.com>
pkgname=graywolf
pkgver=0.1.3
pkgrel=1
epoch=
pkgdesc='An oopensource placement tool'
arch=('i686' 'x86_64')
url='https://github.com/rubund/graywolf/'
license=('GPL')
provides=('libycadgraywolf.so')
depends=('bash' 'libx11')
source=("https://github.com/rubund/${pkgname}/archive/${pkgver}.zip")
sha512sums=('d9462365bc80f77547b4ee8d9a1bd4b451d451f949fb25cd94271050c82bfa359ac82000bdddac0fbee0bcf7536c980d247adf00a129554e2ba6ecfe288dd3b2')
options=('!makeflags')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
