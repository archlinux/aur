# Maintainer: Christophe Gueret <christophe.gueret@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar-toolkit
pkgver=0.98.1
pkgrel=1
pkgdesc="Set of widgets for Sugar applications"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('sugar-desktop' 'glucose')
depends=('python2' 'sugar-datastore' 'sugar-presence-service' 'hippo-canvas' 'alsa-lib' 'python2-gconf' 'python2-rsvg')
makedepends=('intltool>=0.33' 'gcc' 'perl>=5.8.1')
source=(http://download.sugarlabs.org/sources/sucrose/glucose/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('ff0e201eb0f404a6d2fa7297d5b723c1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PYTHON=python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}


