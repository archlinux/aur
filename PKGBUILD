# Maintainer graysky <graysky AT archlinux DOT us>

# EDIT the build function to build disired PROJECT and ARCH, see:
# https://wiki.libreelec.tv/development-1/build-basics#building
#
# When complete, there will be no package, you can manually copy the images
# from $srcdir/target/

pkgname=libreelec-git
pkgver=r38691.d451eca1aa
pkgrel=1
pkgdesc='Build LibreELEC for any device and architecture'
arch=('x86_64')
url='https://wiki.libreelec.tv/compile'
source=(git+https://github.com/LibreELEC/LibreELEC.tv.git)
license=('None')
makedepends=(git)
depends=(gperf patchutils unzip lzop xorg-mkfontscale xorg-bdftopcf
  java-runtime zip wget bc libxslt python3 libxml-perl perl-parse-yapp
  perl-json rpcsvc-proto
  )
sha256sums=('SKIP')
_gitname=LibreELEC.tv

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  PROJECT=RPi DEVICE=RPi4 ARCH=arm make image
}

package() {
  echo
  echo
  echo
  echo " --> Build was successful."
  echo " --> The target images can be found in $_gitname/target/"
  echo " --> Enjoy!"
  echo
  echo
  echo
}
