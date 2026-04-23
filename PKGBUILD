# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=cryptaliagy
_pkgname=httpget
_pkgexec=httpget
pkgname=${_pkgname}-bin
pkgdesc="A ridiculously simple and small http get client to use for health checks"
pkgver=0.1.23
_pkgvername=${pkgver}
pkgrel=1

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgexec}")
conflicts=("${_pkgname}"{,-git})

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-tls.${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-tls.${_barch[1]}")
sha256sums=('27484b69ee5b4ae12e79115afb21982a4a3a864b33b8be1618edfeee931309ce')
sha256sums_x86_64=('15b5c467d96564684312f7534d1a97dfb228768122882dfbd578e46641151c23')
sha256sums_aarch64=('82a452a75a578018c3f2c834332e63a169b09694334016366fa022d927d93698')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgexec}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgexec}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
