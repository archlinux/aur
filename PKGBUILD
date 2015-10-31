# Maintainer: Eduardo Vazquez <lalohao@gmail.com>
pkgname=forgottenserver-git
pkgver=r2167.ebe14b8
pkgrel=1
license=('GPL')
pkgdesc=" A free and open-source MMORPG server emulator written in C++"
url="https://github.com/otland/forgottenserver"
arch=('i686' 'x86_64')
depends=('git' 'cmake' 'lua' 'gmp' 'boost' 'boost-libs' 'libmariadbclient')
makedepends=('git' 'cmake')
source=("git://github.com/otland/forgottenserver.git")
md5sums=('SKIP')

# pkgver(){
#   cd forgottenserver
#   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
# }

build() {
  mv forgottenserver /tmp/
  cd /tmp/forgottenserver
  rm -rf build
  mkdir build
  cd build
  cmake ..
  make
}

package() {
  cd /tmp/forgottenserver/build/
  echo "Forgottenserver has been compiled succesfully!"
  echo "Check dir for binary:"
  pwd
}
