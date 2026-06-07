# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=riii111
_pkgname=sabiql
pkgname=${_pkgname}-bin
pkgdesc="A fast, driver-less TUI to browse, query, and edit PostgreSQL databases"

pkgver=1.12.3
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
sha256sums=('395a7d1b3d6f0e437998a3ae2842dddbb2ff0555e06c565fb7c093947c5b6ed8'
            '74812e48d7ae28605df88571cdcf5002bb1de19b89c8a05a07ccfecd9c1962e4')
sha256sums_x86_64=('c8602b3ad212895c8bb370238a6feded92ec9136c254cb6af6c704728828cb6d')
sha256sums_aarch64=('0a9846538c62aacdf4733000c79c5a9dde36f771f58288cd6788325e43fb04e8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
