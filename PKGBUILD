# Maintainer: sga013
_pkgauthor=Lenivaya
_pkgname=qrrs
pkgname=${_pkgname}-bin
pkgver=0.1.10
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

sha256sums=('4f26de442e47bd498f4f75757547bab5d969f32cf99bb5d1b024cbc2fb491ec0')

prepare() {
	cd $srcdir
	tar -xf ${_pkgname}-x86_64-unknown-linux-gnu.tar.gz
}

package() {
	cd $srcdir || exit
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
