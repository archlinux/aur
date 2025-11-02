# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=seeyebe
_pkgname=gmap
pkgname=${_pkgname}-bin
pkgver=0.4.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Git repository analysis tool for churn and heatmap visualization"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}-${pkgver}.zip")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}-${pkgver}.zip")
sha256sums=('497f5a540ff944524f538287b72cd75b69a29ab90964620f29b6acaa7c434451'
            'fa895dabddef8898b950bfdd25d2c138b261aafd6afdff77974da927763dff27')
sha256sums_x86_64=('fbf643656bf2d0c374ad4b6c15550c6c4888bd88403f3dc5c1d65fb50e69dea2')
sha256sums_aarch64=('ff8ef414ae81aeab27ab2710b2a60b32d678234ca169dd3d296fb25f27b99652')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
