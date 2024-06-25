# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Andrés Morales <quillb.02@gmail.com>
pkgname=hyprsources-git
pkgver=1.0.r1.823d51d
pkgrel=1
epoch=
pkgdesc="A tool for managing sourcefiles in hyprland"
arch=(x86_64)
url="http://github.com/andrwui/hyprsources"
license=('MIT')
groups=()
depends=(go)
makedepends=(go)
checkdepends=()
optdepends=()
provides=(hyprsources)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
} 

build() {
  cd "$srcdir/hyprsources"
  go build -o hyprsources
}

package() {
  cd $srcdir/hyprsources
  sudo install -Dm755 hyprsources "/usr/bin/hyprsources"
}
