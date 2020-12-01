# Maintainer: Milkii Brewster <milkii on Freenode IRC>
maintaner="Milkii Brewster <milkii on Freenode IRC>"
pkgname=cv_to_cc.lv2-git
pkgdesc="Convert LV2 CV to MIDI CV"
pkgver=r1.04adeed
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/polyeffects/cv_to_cc.lv2"
license=(GPL)
groups=()
depends=('git' 'lv2')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/polyeffects/cv_to_cc.lv2)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "cv_to_cc.lv2"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "cv_to_cc.lv2"
}

build() {
  cd "cv_to_cc.lv2"
	# ./configure --prefix=/usr
	make
}

package() {
  cd "cv_to_cc.lv2"
	make DESTDIR="$pkgdir/" install
}
