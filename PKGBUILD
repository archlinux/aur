# Maintainer: Julian Geywitz <aur@geigi.de>+

pkgname=tranqil
_gitname=tranqil
pkgdesc='Relax to the soothing sounds of nature'
pkgver=1.1.6
pkgrel=1
url='https://github.com/nick92/tranqil'
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('cmake' 'vala' 'granite' 'git' 'libnotify')
depends=(
  'gtk3' 'granite' 'gstreamer' 'libnotify'
)
conflicts=("${_gitname}")
provides=("${_gitname}")
source=(
  "https://github.com/nick92/tranqil/archive/${pkgver}.zip"
  
)
sha256sums=(
  'SKIP'
)

build() {
    cd "${_gitname}-${pkgver}"
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${_gitname}-${pkgver}/build"
    DESTDIR="${pkgdir}" make install
}
