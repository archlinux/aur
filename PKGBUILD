# Maintainer: Diego Mascialino <dmascialino@gmail.com>
#

pkgname=encuentro
pkgver=5.0
pkgrel=1
pkgdesc="Busque, descargue, y vea el maravilloso contenido ofrecido por el Canal Encuentro. Search, download and see the wonderful content ofered by Encuentro (Argentine TV channel)"
url="http://launchpad.net/encuentro"
arch=('any')
depends=('python2' 'python2-pyqt4' 'python2-defer' 'python2-requests' 'python2-beautifulsoup4' 'python2-xdg' 'youtube-dl')
optdepends=('python2-notify: provides notifications')
makedepends=('python2-distribute' )
license=('GPL3')
source=(http://encuentro.taniquetil.com.ar/download/${pkgname}-${pkgver}.tar.gz)
md5sums=('8709b7200607efc895b5e847bff432f2')


build() {
    cd ${srcdir}/encuentro-${pkgver}
    python2 setup.py build
}

package() {
    cd ${srcdir}/encuentro-${pkgver}
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

