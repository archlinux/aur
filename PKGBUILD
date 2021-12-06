# Maintainer: jokersus <jokersus.cava@gmail.com>
_pkgname=f3d
_pkgown=f3d-app
pkgname=${_pkgname}-bin
pkgver=1.2.0
pkgrel=1
epoch=1
pkgdesc='A fast and minimalist 3D viewer'
arch=('x86_64')
url="https://github.com/$_pkgown/$_pkgname"
license=('BSD')
provides=('f3d')
conflicts=('f3d')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-Linux.tar.xz")
sha256sums=('b062143fefb37de78aabf935fe0331c6b7a5558e71c69a814da772e6c14afbe7')

package() {
	cd "$_pkgname-$pkgver-Linux"
	install -Dm755 "./bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "./lib/libf3d.so" "${pkgdir}/usr/lib/libf3d.so"
	cp -r "./share" "${pkgdir}/usr/share/"
}
