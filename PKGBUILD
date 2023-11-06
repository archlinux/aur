# Maintainer: mekb https://github.com/mekb-turtle
# shellcheck disable=SC2034
pkgname=foto
pkgver=2.0.2
pkgrel=1
pkgdesc='Simple image viewer written in C'
arch=('any')
url='https://github.com/mekb-turtle/foto'
license=('MPL-2.0')
source=("foto::git+${url}.git#tag=v$pkgver")
sha256sums=(SKIP)
makedepends=('git' 'pandoc')
depends=('sdl2' 'sdl2_image')
provides=('foto')

package() {
	make RELEASE=1 INSTALL_DIR="$pkgdir/usr" -C "$srcdir/foto" install
}
build() {
	make RELEASE=1 -C "$srcdir/foto" build man
}
