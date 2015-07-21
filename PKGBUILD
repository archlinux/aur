# Maintainer: Christophe Gueret <christophe.gueret@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar-datastore
pkgver=0.106.0
pkgrel=1
pkgdesc="Backend of the Sugar Journal"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('sugar-desktop' 'glucose')
depends=('python2' 'python2-dbus' 'python2-gobject' 'sugar-base' 'python2-xapian' 'python2-cjson')
makedepends=('gcc')
source=(http://download.sugarlabs.org/sources/sucrose/glucose/${pkgname}/${pkgname}-${pkgver}.tar.xz)
md5sums=('321bfeea688d4b482f202185e7401df2')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PYTHON=python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}


