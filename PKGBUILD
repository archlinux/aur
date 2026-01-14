# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=bymehul
_pkgname=ghk
pkgname=${_pkgname}-bin
pkgdesc="GitHub helper — push code with ease."

pkgver=1.0.3
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${arch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${arch[1]}")
sha256sums=('4a0fe0a8540c8618d99d198f19fd7c907e889a225aa6e7ddd5e8d054f8d64243'
            '0f4f57e85e04d12e979edc9456f17fa90fdb1d115d810b53c4dad5666d61d33b')
sha256sums_x86_64=('8084174f87ee5c77e3520e2d73ad1392b8654b5d509a3a0a8ee3692c2e38d219')
sha256sums_aarch64=('a212aa3124c1ba9439347c1f14538e996296f5c8613ba22c3bae3c685cc5208c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
