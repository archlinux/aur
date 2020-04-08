# Maintainer: AnonymerNiklasistanonym <niklas.mikeler@gmail.com>
pkgname=karaokemusicvideomanager
pkgver=2.0.0
pkgrel=1
pkgdesc='A software that scans folders after music videos, brings them together in a list and starts them'
arch=('x86_64')
url='https://github.com/AnonymerNiklasistanonym/KaraokeMusicVideoManager'
license=('MIT')
depends=('jdk8-openjdk' 'java8-openjfx')
makedepends=('maven' 'python')
provides=("$pkgname")
conflicts=("$pkgname")
_gitname="$pkgname.git"
source=("$_gitname::git+$url#branch=master")
sha1sums=('SKIP')

build() {
  cd "$_gitname"
  make build
  make dist
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install install_desktop
}
