# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=gtklick
pkgver=0.6.4
pkgrel=1
pkgdesc='A graphical user interface for the klick metronome for JACK'
arch=('i686' 'x86_64')
url='http://das.nasophon.de/gtklick/'
license=('GPL')
depends=('desktop-file-utils' 'klick' 'python2-pyliblo' 'pygtk')
makedepends=()
source=("http://das.nasophon.de/download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7799d884126ccc818678aed79d58057f8cf3528e9f1be771c3fa5b694d9d0137')
install="${pkgname}.install"

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}/"  --optimize=1
}
