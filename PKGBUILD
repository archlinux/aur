# Maintainer: Dimio <dimio at dimio dot org>

_pkgname=gost
pkgname=gost-v3-bin
pkgver=3.0.0.20240904
_ghpkgver=3.0.0-nightly.20240904
pkgrel=1
pkgdesc="GO Simple Tunnel - A simple security tunnel"
arch=('x86_64' 'i386')
url="https://gost.run/en/"
_ghurl="https://github.com/go-gost/gost"
license=('MIT')
provides=("${pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source_x86_64=("${_ghurl}/releases/download/v${_ghpkgver}/${_pkgname}_${_ghpkgver}_linux_amd64.tar.gz")
source_i386=("${_ghurl}/releases/download/v${_ghpkgver}/${_pkgname}_${_ghpkgver}_linux_386.tar.gz")

sha256sums_i686=('e3e1fcf249b2c1f657c846c0261321fca8915330d113b4429a368e89c2c1961c')
sha256sums_x86_64=('c49ba8b5433530f14ab54b3e8f2f239d7196333895d8310c0a51afa21c9b6b25')

package() {
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
