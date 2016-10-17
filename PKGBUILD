# Maintainer: Christophe Gueret <christophe.gueret@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar-datastore
pkgver=0.110.0
pkgrel=1
pkgdesc="Backend of the Sugar Journal"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('sugar-desktop' 'glucose')
depends=('python2' 'python2-dbus' 'python2-gobject' 'sugar-base' 'python2-xapian' 'python2-cjson')
makedepends=('gcc')
source=(https://github.com/sugarlabs/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('444dc5f6148190e12696353fd451674e')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  PYTHON=python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

