# Maintainer: Christophe Gueret <christophe.gueret@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar-artwork
pkgver=0.110.0
pkgrel=1
pkgdesc="Sugar gtk engine, themes and icons"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('sugar-desktop' 'glucose')
depends=('python2' 'gtk2')
makedepends=('icon-slicer' 'icon-naming-utils>=0.8.2' 'gcc' 'xorg-xcursorgen')
source=(https://github.com/sugarlabs/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('4753e97731631d3aecba59fb351e687d')

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


