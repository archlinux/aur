# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=rohansx
_pkgname=ctxgraph
pkgname=${_pkgname}-bin
pkgdesc="Local-first context graph engine for AI agents and human teams"

pkgver=0.7.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc' 'libstdc++')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}.tar.gz")
sha256sums=('2eabe383c8d84b6565c69065deea49ca4ac6d212c462cb94384b110bae759f04'
            '047b1a7727f767dd38b9f5af025d1f9c1cc0ebfdf01ecd27c1ed5614434ac82a')
sha256sums_x86_64=('9b90836490951e9b8f7a34026d8ea424e7452c46b1f4238722e913130fc26692')
sha256sums_aarch64=('6ada62185b47913d4b4473d4495f549f6d3ebb961bf853df3403c94aa7edc8d5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
