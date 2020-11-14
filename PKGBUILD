# Maintainer: Spencer Harmon

pkgname="vendor-reset-git"
pkgver=0.0.11
pkgrel=1
epoch=
pkgdesc="reset routines for navi et al."
arch=('any')
url="https://github.com/gnif/vendor-reset"
license=('GPL-2.0')
groups=()
depends=('make'
  'gcc'
  'gcc49'
  'binutils'
  'perl'
  'sdl'
  'sdl_image'
  'sdl_ttf'
  'perl-crypt-openssl-rsa'
  'perl-capture-tiny')
makedepends=('make'
  'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!buildflags' '!makeflags')
install=
changelog=
source=("git://github.com/gnif/vendor-reset")
noextract=()
md5sums=('SKIP')
pkgver(){
  . $srcdir/vendor-reset/dkms.conf; echo $PACKAGE_VERSION
}

build() {
  cd vendor-reset
  make
}

package() {
  cd vendor-reset
  make INSTALL_MOD_PATH="pkgdir/"
}
