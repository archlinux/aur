# Maintainer: Christophe Gueret <christophe.gueret@gmail.com>

pkgname=sugar-toolkit-gtk3
pkgver=0.106.0
pkgrel=3
pkgdesc="Set of widgets for Sugar applications"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('sugar-desktop' 'glucose')
depends=('gtk3' 'python2' 'sugar-datastore' 'sugar-presence-service' 'hippo-canvas' 'alsa-lib' 'python2-gconf' 'python2-rsvg' 'gobject-introspection')
makedepends=('intltool>=0.33' 'gcc' 'perl>=5.8.1')
source=(https://github.com/sugarlabs/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('932cf8a6dc6fc99837c9f0c78aeee03b')

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


