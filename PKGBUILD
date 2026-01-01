# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=paramientos
_pkgname=presto
pkgname=${_pkgname}-bin
pkgdesc="Presto is a dependency manager for PHP and drop-in-replacement for Composer"

pkgver=0.1.10
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}")
sha256sums=('a18277567f028ea14636a15b024b8a187d8e90aef7f19466ec03913e10a25a2b'
            '73496093fa9eb666ddd2b81bde20166ff90a4e68c61f0c7d64c67b2d9cc4022d')
sha256sums_x86_64=('80072f4e91a9881bcf2076c670d60c2bdd010e17b122133fbc4a5eaa995b2665')
sha256sums_aarch64=('985a4ab5b5d10f6bd07353c24bdb170c03586f4b8f84ef7bd16c676db4970832')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
