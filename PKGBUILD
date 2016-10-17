# Maintainer: Christophe Gueret <christophe.gueret@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar-toolkit
pkgver=0.110.0
pkgrel=1
pkgdesc="Set of widgets for Sugar applications"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('sugar-desktop' 'glucose')
depends=('python2' 'sugar-datastore' 'sugar-presence-service' 'hippo-canvas' 'alsa-lib' 'python2-gconf' 'python2-rsvg')
makedepends=('intltool>=0.33' 'gcc' 'perl>=5.8.1')
source=(https://github.com/sugarlabs/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('4c9f8316324b1107ab568690d1be4698')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PYTHON=python2 ./autogen.sh
  PYTHON=python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}


