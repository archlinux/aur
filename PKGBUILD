# Maintainer: Asayu <asayu.yuki@gmail.com>
pkgname=yasp-git
_gitName="YetAnotherSlotProject"
pkgver=v1.0.2.r0.g2cfb594
pkgrel=1
pkgdesc="A basic slot machine program for linux "
arch=('any')
url="https://github.com/AsayuGit/YetAnotherSlotProject"
license=('GPL2')
depends=(sdl2 sdl2_image sdl2_mixer)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/AsayuGit/YetAnotherSlotProject.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitName
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_gitName
	make
}

package() {
	cd $_gitName
	make DESTDIR="$pkgdir/" install
}
