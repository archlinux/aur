# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>

pkgname=virglrenderer-git
pkgver=403
pkgrel=1
pkgdesc='The virgil3d rendering library is a library used by qemu to implement 3D GPU support for the virtio GPU'
arch=('i686' 'x86_64')
license=('MIT')
url='https://virgil3d.github.io/'
depends=('libepoxy' 'mesa')
makedepends=('python2' 'git')
source=('git://anongit.freedesktop.org/git/virglrenderer')
sha256sums=('SKIP')

pkgver() {
  cd virglrenderer
  git rev-list --count HEAD
}

build() {
  cd virglrenderer
  ./autogen.sh --prefix=/usr/

  make
}

package() {
  cd virglrenderer
  make DESTDIR="$pkgdir" install
}
