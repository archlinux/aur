# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Danny Piper <djpiper28@gmail.com>
pkgname=squire-desktop-git
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="A tournament management software for MTG brought to you by Monarch."
arch=("x86_64"
  "x86")
url="https://github.com/MonarchDevelopment/SquireDesktop"
license=('AGPL3')
groups=()
depends=()
makedepends=("cmake"
  "gcc"
  "rustup"
  "cbindgen"
  "python" 
  "qt5-base" 
  "qt5-tools")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=("BE8A6C62B5ABA24102938442F622383DDDDE44BF")

prepare() {
  rm -rf ./SquireDesktop
  git clone https://github.com/MonarchDevelopment/SquireDesktop --recursive
}

build() {
  cd ./SquireDesktop
  mkdir -p ./build
  cd ./build
  rm -rf *
	cmake .. -DCMAKE_BUILD_TYPE=DEBUG
  cmake --build . -j
}

check() {
  true
}

package() {
  cd ./SquireDesktop
  cd ./build
  sudo cp ./SquireDesktop /usr/bin
}
