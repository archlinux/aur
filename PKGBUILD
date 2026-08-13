# Maintainer: tiandic <2323748675@qq.com>

pkgname=easycut
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple software for doing basic video editing tasks"
arch=('i686' 'x86_64')
url="https://github.com/tiandic/easyCut"
license=('GPL')
depends=(
  qt6-declarative
  qt6-multimedia
  ffmpeg
)
makedepends=(
  base-devel
  cmake
  git
)
source=("${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("69756588976fbac14c1e4d2d42754e6d58ed396c6329b8f4345da2c3761729c3")

build() {
  cd "easyCut-$pkgver"
  cmake -B build
  cmake --build build
}

package() {
  cd "easyCut-$pkgver"
  install -vDm755 build/appeasyCut -t "$pkgdir/usr/bin/"
  install -vDm755 build/exec_cmd/exec_cmd -t "$pkgdir/usr/lib/easyCut/"
  install -vDm755 build/exec_cmd_gui/appexec_cmd_gui -t "$pkgdir/usr/lib/easyCut/"
}
