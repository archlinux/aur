# Maintainer: sga013
_pkgname=qrrs
pkgname=${_pkgname}-bin
pkgver=0.1.11
pkgrel=1
pkgdesc='QRrs is a simple, cross-platform, command-line utility written in rust for working with qr codes (what actually follows from the name).'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")

sha256sums=('289f1a4597317b50c7f52fdb8672a4f2c38730ea756ca8c3052029c451f5b8dd')

prepare() {
	cd $srcdir
	tar -xf ${_pkgname}-x86_64-unknown-linux-gnu.tar.gz
}

package() {
	cd $srcdir || exit
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
