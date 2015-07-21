# Maintainer: Christophe Gueret <christophe.gueret@gmail.com>

pkgname=sugar-runner
pkgver=0.106.0
pkgrel=1
pkgdesc="Set of scripts to run sugar"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('sugar-desktop' 'glucose')
depends=('python2' 'sugar-datastore>=0.102.0' 'sugar-presence-service' 'sugar>=0.106.0' 'xorg-xinit')
makedepends=('intltool>=0.33' 'gcc' 'perl>=5.8.1')
source=(http://download.sugarlabs.org/sources/sucrose/glucose/${pkgname}/${pkgname}-${pkgver}.tar.xz)
md5sums=('c7c17261b1c499cc4a79ac828c6579d1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PYTHON=python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}


