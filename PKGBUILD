# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=3dfsb
pkgver=1.2
pkgrel=1
pkgdesc="3D file browser"
arch=('i686' 'x86_64')
url="https://github.com/tomvanbraeckel/3dfsb/"
license=("GPL")
makedepends=('imagemagick')
depends=('freeglut' 'file' 'sdl_image' 'glu' 'gstreamer' 'xdotool-git')
install=$pkgname.install
source=("https://github.com/tomvanbraeckel/3dfsb/archive/v${pkgver}.tar.gz"
        '3dfsb.desktop')
sha256sums=('e04497251a4ffb4c003ed0c22316501cf2e95c201d233ddbb9c79c2f9d696c2e'
            'c53f4ba2ed02513c3ec60f9182fb25c71f03d19e60498f563d960bd93bc6eb84')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./compile.sh
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  install -dm755 ${pkgdir}/usr/bin
  install -dm755 ${pkgdir}/usr/share/applications
  install -m755 3dfsb ${pkgdir}/usr/bin/3dfsb
  install -m644 ../3dfsb.desktop ${pkgdir}/usr/share/applications/3dfsb.desktop
}

# vim:set ts=2 sw=2 et:
