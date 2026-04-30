# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=jdx
_pkgname=hk
pkgname=${_pkgname}-bin
pkgver=1.44.3
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
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('4580e1e27578e6fb28a76385413b4504b3b57d88b75f634a87d3b42c4eb6a459'
            '39fa4d7227deb764d456a5e1f5e995ff644417e2e9f2d8ed27008981bfad69be')
sha256sums_x86_64=('8ff22722b831acae2ac61eddbe349497f9538ac7ac28f4b1a2e3dd7c0e43ee8c')
sha256sums_aarch64=('85e0f8b7c3107f5b7853390bf8201d3d9839021e3f2d7629f5457f7569218fcc')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
