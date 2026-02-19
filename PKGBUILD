# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=FlerAlex
_pkgname=certradar-cli
pkgname=${_pkgname}-bin
pkgdesc="Fast SSL/TLS security scanner with certificate transparency search, protocol analysis, and security grading"

pkgver=0.1.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${arch[0]}.tar.gz")
sha256sums=('cda8c5960a719e0bc5aac2e8d858bc05b2e028d889810ec716dd08d7b251e548'
            '04320b46c5ddec9c36bfb4450623ffd3041334930202272742bb52b58d67062a')
sha256sums_x86_64=('dd32adbb98ee40c054f72bd4b71b17a6461a2ceadec124f15ffde3a41346779e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE"-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
