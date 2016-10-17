# Maintainer: Christophe Gueret <christophe.gueret@gmail.com>

pkgname=sugar-runner
pkgver=0.110.0
pkgrel=1
pkgdesc="Set of scripts to run sugar"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('sugar-desktop' 'glucose')
depends=('python2' 'sugar-datastore>=0.110.0' 'sugar-presence-service' 'sugar>=0.110.0' 'xorg-xinit')
makedepends=('intltool>=0.33' 'gcc' 'perl>=5.8.1')
source=(https://github.com/sugarlabs/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('78cf26eea2f1ff97886cd9259543426f')


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


