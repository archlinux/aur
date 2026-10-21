# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=riii111
_pkgname=sabiql
pkgname=${_pkgname}-bin
pkgdesc="A fast, driver-less TUI to browse, query, and edit PostgreSQL databases"

pkgver=3.0.2
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
sha256sums=('b14fdc332a3a3586e08395cd51d4861c6c500b3ddccfe49998c290a508baad1c'
            '74812e48d7ae28605df88571cdcf5002bb1de19b89c8a05a07ccfecd9c1962e4')
sha256sums_x86_64=('1a471cbd634f61f4070b2f7b853cac946bd34da04dd30116ce925ddf84ad2211')
sha256sums_aarch64=('a73a1a7f336462f633bea357b7ac237bbbeb52552429b7b6eb86e1165bf8ad29')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
