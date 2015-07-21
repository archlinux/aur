# Maintainer: Christophe Gueret <christophe.gueret@gmail.com>

pkgname=sugar-toolkit-gtk3
pkgver=0.106.0
pkgrel=1
pkgdesc="Set of widgets for Sugar applications"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('sugar-desktop' 'glucose')
depends=('gtk3' 'python2' 'sugar-datastore' 'sugar-presence-service' 'hippo-canvas' 'alsa-lib' 'python2-gconf' 'python2-rsvg')
makedepends=('intltool>=0.33' 'gcc' 'perl>=5.8.1')
source=(http://download.sugarlabs.org/sources/sucrose/glucose/${pkgname}/${pkgname}-${pkgver}.tar.xz)
md5sums=('a2ceabea1c5d85ef704634b42731c139')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PYTHON=python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}


