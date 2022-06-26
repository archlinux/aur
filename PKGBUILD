# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=minivideo-git
pkgdesc="MiniVideo is a video framework developed from scratch in C/C++"
pkgver=0.14_787.62894a2
pkgrel=2
arch=('x86_64' 'i686')
license=('LGPL3')
url="https://github.com/emericg/MiniVideo"
source=("${pkgname}::git+https://github.com/emericg/MiniVideo.git")
sha256sums=('SKIP')
makedepends=('cmake')
conflicts=('minivideo')

pkgver() {
    cd "$srcdir/$pkgname"
    echo "0.14_$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname/minivideo/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
  make DESTDIR="${pkgdir}" install
}

