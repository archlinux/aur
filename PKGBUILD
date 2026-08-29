# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=reemus-dev
_pkgname=gitnr
pkgname=${_pkgname}-bin
pkgver=0.3.1
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A CLI to generate .gitignore files using one or more templates"
arch=('x86_64')
_barch=('amd64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'openssl')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/readme.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
sha256sums=('b16ae045901cd75e09f19fec662522a279218eed8c70e6fac85789f3d76bea9d'
            'df5a89f2090b5254ef1c31ee0b959a128a74c39a6dcbc814b8ff61008f24bf65')
sha256sums_x86_64=('f4b7ca390171a439a4f2e8441895d6865b6d64f75a37bcd092a12f0c56029c1c')



package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
