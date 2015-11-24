# Maintainer: killruana <killruana@gmail.com>
pkgname=qflow
pkgver=1.0.99
pkgrel=1
epoch=
pkgdesc='OSU 0.35um open-source standard cell set'
arch=('i686' 'x86_64')
url='http://opencircuitdesign.com/qflow/'
license=('GPL')
depends=('graywolf' 'qrouter' 'yosys' 'tcsh')
source=("${url}archive/${pkgname}-${pkgver}.tgz")
sha512sums=('6b6bb473b03552043684394c8ff5ef3c460a3d837a28627f278b87f1c970552119922e2965429269b7660184b76f507a69280dadae1344081e0f7d0f941921b7'  )

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --with-bindir=/usr/bin \
        --with-libdir=/usr/share/${pkgname}
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
