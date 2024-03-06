# Maintainer: Black_Codec <f.dellorso@gmail.com>

pkgname=microterm-git
_pkgname=microterm
pkgver=r5.9d904a9
pkgrel=1
pkgdesc="Simple VTE-based GTK terminal emulator"
arch=('any')
url="https://github.com/BlackCodec/microterm/"
license=('GPL3')
depends=('gtk3>=3.18.9' 'vte3>=0.42.5')
makedepends=('git' 'make')
source=("git+https://github.com/BlackCodec/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
 cd "$srcdir/$_pkgname"
 make build
}

package() {
   cd "$srcdir/$_pkgname"
   make TARGET="$pkgdir" install
}
