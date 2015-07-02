# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>

pkgname=wt-classes
pkgver=1.4.1
pkgrel=3
pkgdesc="Utility classes used by Wt applications"
arch=('i686' 'x86_64')
depends=('wt' 'python' 'pango')
makedepends=('python-docutils' 'doxygen' 'cmake')
options=('!emptydirs')
url="https://bitbucket.org/starius/wt-classes"
license=('GPL')
source=("https://bitbucket.org/starius/wt-classes/downloads/${pkgname}-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
  make ECHO=echo
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make ECHO=echo DESTDIR="${pkgdir}" install
}

md5sums=('fb9284cf7dd36a9041ff7721c824a1e7')
