# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=pencil2d
pkgver=0.6.0
pkgrel=1
pkgdesc="An easy, intuitive tool to make 2D hand-drawn animations"
arch=('x86_64' 'i686')
url="https://pencil2d.org/"
license=('GPL2')
depends=('qt5-multimedia' 'qt5-svg' 'qt5-xmlpatterns' 'hicolor-icon-theme' 'ffmpeg')
source=("https://github.com/pencil2d/pencil/archive/${pkgver}.tar.gz")
md5sums=('46ec6cb485b45ede9bd6a9728c9fc1a5')

build() {
  cd "${srcdir}/pencil-${pkgver}"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/pencil-${pkgver}"

  make install INSTALL_ROOT="${pkgdir}"
  rm -rf "${pkgdir}/usr/lib"
}
