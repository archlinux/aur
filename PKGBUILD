# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=juan-leon
_pkgname=pipe-cutter
pkgname=${_pkgname}-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Command line tool to filter out some of the data piped in"
arch=('x86_64' 'i686')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

depends=('glibc' 'gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-unknown-linux-gnu.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('6b0382b16279f26ff69014300541967a356a666eb0b91b422f6862f6b7dad17e'
            'd3d3df420543fd3250b16e7fe46f02a8b79310d3d4be4445c3b84831c36a2caf')
sha256sums_x86_64=('0e62e87a3fefcea4d9704a72e3ee69a36946072d5b535586f189b4f301f283b7')
sha256sums_i686=('686c4952c00db324d46a635433aa7a12ed489156c56212320c5b9de59ffc3dbc')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
