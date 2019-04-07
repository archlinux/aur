# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=mpv-mpris-git
pkgver=0.2.1.g5413e5d
pkgrel=1
pkgdesc="MPRIS plugin for mpv. (GIT version)"
arch=('x86_64')
depends=('mpv'
         'glib2'
         )
license=('MIT')
url='https://github.com/hoyon/mpv-mpris'
makedepends=('git')
provides=('mpv-mpris')
conflicts=('mpv-mpris')
source=('git+https://github.com/hoyon/mpv-mpris.git')
sha256sums=('SKIP')
install=mpv-mpris-git.install

pkgver() {
  cd mpv-mpris
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd mpv-mpris
  make
}

package() {
  cd mpv-mpris
  install -Dm755 mpris.so "${pkgdir}/usr/share/mpv/scripts/mpris.so"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
