# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=plasma-smart-video-wallpaper-reborn
pkgname=plasma6-wallpapers-smart-video-wallpaper-reborn
pkgver=2.2.0
pkgrel=1
pkgdesc="Smart KDE Plasma 6 Wallpaper plugin to play videos on your Desktop/Lock Screen"
arch=('any')
url="https://github.com/luisbocanegra/$_gitname"
license=('GPL3')
depends=('plasma-workspace' 'qt6-multimedia' 'qt6-multimedia-ffmpeg')
makedepends=('extra-cmake-modules' 'gettext' 'python')
source=("${_gitname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha256sums=('c571fa758e94069ab775c94371f60862d23a45421a7d3daa28a4a98d0475c704')

build() {
  cd "${srcdir}/${_gitname}-$pkgver" || exit
  python ./kpac i18n --no-merge
  cmake -B build -S .
  cmake --build build
}

package() {
  cd "${srcdir}/${_gitname}-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
}
