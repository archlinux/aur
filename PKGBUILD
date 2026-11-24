# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=jdx
_pkgname=hk
pkgname=${_pkgname}-bin
pkgver=2.14.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Git hooks and project lints"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'pkl')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('4580e1e27578e6fb28a76385413b4504b3b57d88b75f634a87d3b42c4eb6a459'
            'dea721b42cf8bc842f4df6b0b212c290c49883e8b134b3f829a507c5106546cf')
sha256sums_x86_64=('230e89eaa3bf78aea23ac1584c8de9dd49141487f6067083003d8bdb38fa6c34')
sha256sums_aarch64=('a5503bc4a6cef77697aed92c966f7b444b3fdea4b62b63d9fb0b2b1af7f08c83')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
