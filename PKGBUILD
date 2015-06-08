# Contributor: Jameson Pugh <imntreal@gmail.com>
# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=libappstore
pkgver=0.1
pkgrel=1
pkgdesc="Provides access to the Ubuntu app store through PackageKit"
arch=('i686' 'x86_64')
url="http://launchpad.net/${pkgname}"
license=('GPL' 'LGPL')
depends=('packagekit' 'sqlheavy' 'libgee' 'gtk3')
makedeps=('cmake')
source=("https://launchpad.net/${pkgname}/0.x/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6f96168566db9c07cb1092faeb2a35dc1a0e2e41eb507bd57e70392cdc273177')

build() {
  cd ${srcdir}/${pkgname}

  [[ -d build ]] || mkdir build
  cd build

    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
             -DCMAKE_BUILD_TYPE=Release

    make
}

package() {
  cd "${srcdir}/${pkgname}/build"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
