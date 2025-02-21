# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=caarlos0
_pkgname=svu
pkgname=${_pkgname}-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="Semantic Version Util"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.md"
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums=('207a7990437080845a0aace350bc9ea9e83266024a06a349a3c243250402ceb1'
            '2ece1b79debd2b8571fc049fff5b0bfdaa7b2e32994d47f6c210a947621140ed')
sha256sums_x86_64=('c4d63b67062cc6fb0bddbecc0a86dac96f87db7763be4b09de90a2f9489a5a7c')
sha256sums_aarch64=('9bc786b15e02158a50c219371e40a3e8e73b6bf2d0364f05b7a0adc9530d79ac')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
