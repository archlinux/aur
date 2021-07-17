# Maintainer: Stefan Gehr <stefangehr@protonmail.com>
pkgname=cmuscoverssdl-git
pkgver=r26.df0040b
pkgrel=1
pkgdesc="Simple cover art viewer for cmus using SDL2 and SDL2_Image"
arch=('any')
url="https://github.com/MyLegGuy/cmusCoversSDL"
license=('custom:Creative Commons Legal Code')
depends=('sdl2_image' 'ffmpeg')
makedepends=('git')
provides=('cmusCoverViewer')
source=("${pkgname}::git+https://github.com/MyLegGuy/cmusCoversSDL.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	install -Dm755 cmusCoverViewer "$pkgdir"/usr/bin/cmusCoverViewer
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

