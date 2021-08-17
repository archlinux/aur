# Maintainer: VCalV
pkgname=overdrive2opus-git
pkgver=r4.a94e0b8
pkgrel=1
pkgdesc="convert overdrive audiobooks into opus files with chapters and thumbnails"
arch=('x86_64')
url="https://github.com/vcalv/overdrive2opus"
license=('GPL3')
groups=()
depends=(python ffmpeg opus-tools)
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/vcalv/overdrive2opus")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	cd "$pkgname"
	install -D overdrive2opus.py "$pkgdir/usr/bin/overdrive2opus"
}
