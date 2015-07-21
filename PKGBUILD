# Maintainer: Christophe Gueret <christophe.gueret@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar
pkgver=0.106.0
pkgrel=1
pkgdesc="Sugar is the core component of a worldwide effort to provide every child with equal opportunity for a quality education"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('sugar-desktop' 'glucose')
depends=('python2' 'gtk2' 'telepathy-mission-control' 'python-simplejson' 'python2-wnck' 'sugar-datastore>=0.102.0' 'sugar-artwork' 'sugar-toolkit' 'metacity' 'python2-dateutil' 'sugar-toolkit-gtk3' 'python2-simplejson' 'python2-gwebsockets-git')
makedepends=('gcc' 'perl>=5.8.1')
source=(http://download.sugarlabs.org/sources/sucrose/glucose/${pkgname}/${pkgname}-${pkgver}.tar.xz)
md5sums=('420ec473500fdd94218409c6eee84c86')
install=sugar.install

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PYTHON=python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}



