# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=romancitodev
_pkgname=cargo-pretty
pkgname=${_pkgname}-bin
pkgdesc="A cargo build wrapper with a live, animated status view"

pkgver=0.3.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
license=('MIT')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

provides=("${_pkgname}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'libgcc' 'cargo')

options=('!strip')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${arch[0]}-unknown-linux-gnu.tar.gz")
sha256sums=('9f1330329d142368b9736c6efbbe230becee8261faadaae1d03d7f0e538bcc2b'
            '4d105a9bb5753da6a00aea2fd5b691af2ac9cde446981d1a2d569c44ab3c0bb9')
sha256sums_x86_64=('3bf31758f608b88f20d191883624d1a9aca490d4d25201b32b773de3514f3c60')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
