# Maintainer: Christophe Gueret <christophe.gueret@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar-artwork
pkgver=0.106.0
pkgrel=1
pkgdesc="Sugar gtk engine, themes and icons"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('sugar-desktop' 'glucose')
depends=('python2' 'gtk2')
makedepends=('icon-slicer' 'icon-naming-utils>=0.8.2' 'gcc' 'xorg-xcursorgen')
source=(http://download.sugarlabs.org/sources/sucrose/glucose/${pkgname}/${pkgname}-${pkgver}.tar.xz)
md5sums=('99ffcfac3e0f525914deb82188a09e1f')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PYTHON=python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}


