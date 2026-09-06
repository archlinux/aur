# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=wcampbell0x2a
_pkgname=zerus
pkgname=${_pkgname}-bin
pkgver=0.16.1
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Lightweight binary to download only project required crates for offline crates.io mirror"
arch=('x86_64')
_barch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0' 'MIT')

conflicts=("${_pkgname}")
provides=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-MIT-${pkgver}::${_urlraw}/LICENSE-MIT"
		"LICENSE-APACHE-${pkgver}::${_urlraw}/LICENSE-APACHE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}-unknown-linux-musl.tar.gz")
sha256sums=('d804b18bee9eea554a17665bbbaf8222c7daf0686465c4e2426fce0cd5d2e8ef'
            '23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3'
            'fd26644b0118c8ae84a8770bdbbe18f7db14387b5cc19d1de670ad2d98a7ad42')
sha256sums_x86_64=('ec3fd8226a60593b6752058e7a7e06a640d1b3d5bc71026f4391f36522f47cdc')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
