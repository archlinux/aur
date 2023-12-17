# Maintainer: SelfRef <arch@selfref.dev>

_basename=mrpack-install
pkgname="${_basename}"
pkgver=0.16.9
pkgrel=1
pkgdesc="Modrinth Modpack server deployment"
arch=('any')
url="https://github.com/nothub/mrpack-install"
license=('MIT')
makedepends=('go')
source=("${_basename}"::"git+https://github.com/nothub/mrpack-install.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
	cd "$_basename"
	make
}

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" "${_basename}/out/mrpack-install"
}