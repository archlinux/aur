# Maintainer: Christophe Gueret <christophe.gueret@gmail.com>

pkgname=sugar-toolkit-gtk3
pkgver=0.106.1
pkgrel=1
pkgdesc="Set of widgets for Sugar applications"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('sugar-desktop' 'glucose')
depends=('gtk3' 'python2' 'sugar-datastore' 'sugar-presence-service' 'hippo-canvas' 'alsa-lib' 'python2-gconf' 'python2-rsvg' 'gobject-introspection')
makedepends=('intltool>=0.33' 'gcc' 'perl>=5.8.1')
source=(https://github.com/sugarlabs/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('037f769df36d7c98f495536f4b8522eb')

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


