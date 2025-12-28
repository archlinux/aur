# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=paramientos
_pkgname=presto
pkgname=${_pkgname}-bin
pkgdesc="Presto is a dependency manager for PHP and drop-in-replacement for Composer"

pkgver=0.1.7
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
sha256sums=('f5fc84230d8bb7550a4d89c9d5274c0bf564fd42e6ee22e1d9d9ce854e2d1f63'
            '73496093fa9eb666ddd2b81bde20166ff90a4e68c61f0c7d64c67b2d9cc4022d')
sha256sums_x86_64=('c98fcaa0d87acf6247fbad3d24b437ba8c5384cb1272f0253fa6a266aeca2da7')
sha256sums_aarch64=('8d525da193efa48d96b41d21f5f672cd6c07d280986faf30f50a5dba06da739f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
