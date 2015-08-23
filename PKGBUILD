# Maintainer: Kostas Karanikolas <lastname[at]gmail[dot]com>
pkgname=fuel
pkgver=1.0.1
pkgrel=1
pkgdesc="A GUI front-end to Fossil SCM"
arch=(i686 x86_64)
url="https://fuel-scm.org/"
license=('GPL2')
depends=('qt5-base>=5.4.0', 'qt5-webkit>=5.4.0' 'fossil')
source=("https://fuel-scm.org/files/releases/${pkgname}-${pkgver}.tar.gz")

sha256sums=('4e463cb9f3cf9c31c7ae95ce76b558502c0b07e1dd4109da714997f0dc9a65db') # Generate with 'makepkg -g'

build() {
  cd "${srcdir}"
  [ -d build ] && rm -r build
  mkdir build
  cd build
  qmake-qt5 "${srcdir}/${pkgname}-${pkgver}/fuel.pro"
  make
}

package() {
  cd "${srcdir}/build"
  make INSTALL_ROOT="${pkgdir}" install
}

