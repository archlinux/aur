# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=seeyebe
_pkgname=gmap
pkgname=${_pkgname}-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="Git repository analysis tool for churn and heatmap visualization"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
license=('MIT')

depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-linux-${pkgver}.zip")
sha256sums=('497f5a540ff944524f538287b72cd75b69a29ab90964620f29b6acaa7c434451'
            '367673bef71000a477c7deeec88e714ad0e08201037b1e57d241a9e36a207e50')
sha256sums_x86_64=('069eb5d666da3e748621135ba82ac15904e0acbea3b1118ea0b360743b46b74e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
