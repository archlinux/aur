# Maintainer: Fibref <fibref_233@outlook.com>

pkgname=quickjs-ng
_basename=quickjs
pkgver=0.8.0
pkgrel=1
pkgdesc="Small and embeddable JavaScript engine"
url="https://quickjs-ng.github.io/quickjs"
arch=(x86_64)
license=(MIT)
options=(!strip)
conflicts=(quickjs)
makedepends=(cmake)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quickjs-ng/quickjs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("7e60e1e0dcd07d25664331308a2f4aee2a88d60d85896e828d25df7c3d40204e")

build() {
	cd "${_basename}-${pkgver}"
	make INSTALL_PREFIX=/usr
}

package() {
	cd "${_basename}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
