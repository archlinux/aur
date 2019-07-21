# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=pencil2d
pkgver=0.6.4
pkgrel=1
pkgdesc="An easy, intuitive tool to make 2D hand-drawn animations"
arch=('x86_64' 'i686')
url="https://pencil2d.org/"
license=('GPL2')
depends=('qt5-multimedia' 'qt5-svg' 'qt5-xmlpatterns' 'hicolor-icon-theme' 'desktop-file-utils' 'ffmpeg')
source=("https://github.com/pencil2d/pencil/archive/v${pkgver}.tar.gz")
sha512sums=('da28bd6bcdb0336c81e0735bec261373cd1e5db06feb012d4bba098c9df2ebea6f5b763e9c5e5e17c1518efdd6b9cde634ecf2152b49c25cde6c93da63e6fde8')

build() {
  cd "${srcdir}/pencil-${pkgver}"

  qmake-qt5 PREFIX=/usr CONFIG+=release DEFINES+=QT_NO_DEBUG_OUTPUT DEFINES+=PENCIL2D_RELEASE
  make
}

package() {
  cd "${srcdir}/pencil-${pkgver}"

  make install INSTALL_ROOT="${pkgdir}"
}
