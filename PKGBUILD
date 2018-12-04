# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=libquvi-scripts0.4
_srcname=libquvi-scripts
pkgver=0.4.21
pkgrel=2
pkgdesc='Scripts used by libquvi (version 0.4)'
arch=('any')
url='http://quvi.sourceforge.net/'
license=('LGPL2.1')
provides=('libquvi-scripts')
conflicts=('libquvi-scripts')
source=("https://sourceforge.net/projects/quvi/files/0.4/libquvi-scripts/${_srcname}-${pkgver}.tar.xz")
sha256sums=('7c02cc86ac25334892d08bbc31251d78a55ee2a16d57dfa2bda7ac657c8e0f34')

build() {
    cd "${_srcname}-${pkgver}"
    
    ./configure --prefix='/usr'
    
    make
}

package() {
    cd "${_srcname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
}
