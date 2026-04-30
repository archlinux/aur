# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=paramientos
_pkgname=presto
pkgname=${_pkgname}-bin
pkgdesc="Presto is a dependency manager for PHP and drop-in-replacement for Composer"

pkgver=0.1.12
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
sha256sums=('fc776d17dc4517972c9be767e1ec355c324867bc92bfa9b49a9403ad3770a7e6'
            '73496093fa9eb666ddd2b81bde20166ff90a4e68c61f0c7d64c67b2d9cc4022d')
sha256sums_x86_64=('783461e7e3e374e607959dcfc3b374386ae03b836c804a191660097688bfa376')
sha256sums_aarch64=('f8501fa2391af6335c4713f52ab56cc45d1a8184d4e425852768911cf918a966')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
