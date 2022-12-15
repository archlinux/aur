
# Maintainer: KCGD <kcgdhosting@gmail.com>
pkgname=pseudolight
pkgver=1.0.1
pkgrel=1
pkgdesc=""
arch=('x86_64' 'arm64' 'aarch64')
url="https://github.com/KCGD/pseudolight"
license=('GPLv2')
groups=()
depends=('brightnessctl' 'ffmpeg' 'nano')
makedepends=('nodejs' 'npm' 'make')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=(https://github.com/KCGD/pseudolight/archive/refs/tags/$pkgver.tar.gz)
noextract=()
sha256sums=('334f47716ef38a20e5c4e2babbbfa47da6d2df4698fbf18474e0299285fcf040')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  npm i
  make build 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir "$pkgdir/usr/local/bin" -p -v
  cp -v ./Builds/pseudolight "$pkgdir/usr/local/bin"
}
