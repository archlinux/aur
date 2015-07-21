# Maintainer: Christophe Gueret <christophe.gueret@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar-base
pkgver=0.98.0
pkgrel=1
pkgdesc="Helpers for the development of services and activities in Sugar"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('sugar-desktop' 'glucose')
depends=('python2' 'pygtk' 'python2-gobject2' 'python2-decorator' 'python2-cjson' 'pygtksourceview2')
makedepends=('intltool>=0.33' 'perl>=5.8.1' 'pkg-config' 'pygobject2-devel')
optdepends=('ipython: Nicer traceback')
source=(http://download.sugarlabs.org/sources/sucrose/glucose/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('0513b1909d57e69d71d92d244576d32e')
options=('!libtool')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PYTHON=python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

