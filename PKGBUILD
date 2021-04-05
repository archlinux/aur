# Maintainer: Mees Luten <mees [dot] luten [at] gmail [dot] com>
pkgname=libdsp-git
pkgver=r24.783dc00
pkgrel=1
pkgdesc="DSP functions without GR overhead"
arch=('x86_64')
url="https://github.com/altillimity/libdsp"
license=('GPLv3')
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
source=("$pkgname"::'git+https://github.com/altillimity/libdsp.git')
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	mkdir -p "$pkgname"/build
}

build() {
	cd "$pkgname"/build
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}"/usr/local ..
}

package() {
	cd "$pkgname"/build
	make install 
}

