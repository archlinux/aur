# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=jdx
_pkgname=hk
pkgname=${_pkgname}-bin
pkgver=2.8.0
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
            'b418ab39119a4891575f810b1e54fcdc9c7b159a7ec313f4b4021d96db5b15bc')
sha256sums_x86_64=('5b5d7021625d12825b3d44496b466ad65697e02651c8b9fe00117f5c25c73d0a')
sha256sums_aarch64=('d6802a66213972561f9e4aa4d3274decf3725b1fe513da762c0922274c18955b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
