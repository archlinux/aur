# Maintainer: Robin de Rooij <rderooij685 at google's famous mail service dot com>

pkgname=youtube-dl-qt-git
_gitname=youtube-dl-qt
pkgver=82.g5e87881
pkgrel=1
pkgdesc="Qt frontend for youtube-dl"
arch=('i686' 'x86_64')
url="https://github.com/rrooij/youtube-dl-qt"
license=('GPL3')
depends=('qt5-base' 'youtube-dl' 'hicolor-icon-theme')
makedepends=('git' 'make')
optdepends=('ffmpeg: for some youtube-dl functionality')
provides=('youtube-dl-qt')
source=("git+https://github.com/rrooij/youtube-dl-qt")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo "$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	qmake -config release
	make
}

package() {
	cd "$srcdir/$_gitname"
	make INSTALL_ROOT="$pkgdir/" install
}
