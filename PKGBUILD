# Maintainer: Viachaslau Khalikin <khalikin'at'yandex'>

pkgname='freedroidrpg-git'
pkgver=1.0rc2.r20.g642f6a95a
pkgrel=1
arch=('x86_64')
depends=('sdl_mixer' 'sdl_image' 'sdl_gfx' 'hicolor-icon-theme' 'glew')
makedepends=('git' 'mesa')
optdepends=('python' 'lua' 'espeak')
pkgdesc="a mature science fiction role playing game set in the future"
url="http://www.freedroid.org"
license=("GPL")
source=('freedroidrpg-git::git+https://gitlab.com/freedroid/freedroid-src.git')
sha256sums=('SKIP')
conflicts=('freedroidrpg')
provides=('freedroidrpg')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/-/.r/;s/-/./'
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
