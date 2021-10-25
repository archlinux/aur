# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=qt-ffmpeg-imageplugin-git
pkgver=r30.33eea70
pkgrel=1
pkgdesc='Qt image plugin using ffmpeg for webm, apng, avif and more'
arch=('i686' 'x86_64')
url='https://github.com/sandsmark/qt-ffmpeg-imageplugin'
license=('LGPL')
depends=('qt5-base' 'ffmpeg')
makedepends=('git' 'cmake')
conflicts=(qt-ffmpeg-imageplugin)
provides=(qt-ffmpeg-imageplugin)
source=('git+https://invent.kde.org/sandsmark/qt-ffmpeg-imageplugin.git')
md5sums=('SKIP')

pkgver() {
  cd qt-ffmpeg-imageplugin
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd qt-ffmpeg-imageplugin
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd qt-ffmpeg-imageplugin
  make DESTDIR="$pkgdir" install
}
