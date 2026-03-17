# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=riii111
_pkgname=sabiql
pkgname=${_pkgname}-bin
pkgdesc="A fast, driver-less TUI to browse, query, and edit PostgreSQL databases"

pkgver=1.8.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
sha256sums=('5fd9014954700f2877fd9c40908d4c090f64de80e1c1787818a331488925d6f6'
            '74812e48d7ae28605df88571cdcf5002bb1de19b89c8a05a07ccfecd9c1962e4')
sha256sums_x86_64=('46eaaab46d7fd7579e341691c2375bde9c435b2219b9e02940f16aa9297045bb')
sha256sums_aarch64=('6886f44302de6a9c2d31e25d59a5d2475d40bdc8d852d18e8279f9b14bbe41cf')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
