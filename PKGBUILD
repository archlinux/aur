# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=jdx
_pkgname=fnox
pkgname=${_pkgname}-bin
pkgver=1.31.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Fort Knox for your secrets"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('a978dbd843845fb958044bc384c1826bd9cb5e64ea540c392fa410a288de9df4'
            '9400c7183a7c194b3da7d665d5ad7b6ca92f328f1d7d92a2c91bb712026e0d7b')
sha256sums_x86_64=('5cfc8f5746e44188418174fd8338ffcbf22531626a439d166ec81b20203ea520')
sha256sums_aarch64=('627f93c5fac35c08f613415e25904ed6775c50e19bc8e9c6d61fe5d02014635d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
