# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>

pkgname=mmsg-git
pkgver=r22.7dc0500
pkgrel=1.2
pkgdesc="ipc client for maomaowm"
arch=('x86_64')
url="https://github.com/DreamMaoMao/mmsg"
license=('MIT')
depends=(
  glibc
  'wayland>=1.23.1'
)
makedepends=('git' 'make' 'wayland-protocols')
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("$pkgname::git+https://github.com/DreamMaoMao/mmsg.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname}"
	make
}

package() {
	cd "${pkgname}"
	make PREFIX="$pkgdir/usr/" install
}
