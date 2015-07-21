# Maintainer: Christophe Gueret <christophe.gueret@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar-presence-service
pkgver=0.90.2
pkgrel=1
pkgdesc="Interfaces between Sugar and Telepathy Connection Managers"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('sugar-desktop' 'glucose')
depends=('python2' 'sugar-base' 'python2-telepathy' 'gnome-python')
source=(http://download.sugarlabs.org/sources/sucrose/glucose/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('bb53b4dc20e81697deb5124fc2cd0fc6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PYTHON=python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}


