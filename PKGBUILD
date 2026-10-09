# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Sebastian Rutofski <kontakt@sebastian-rutofski.de>

_pkgauthor=cooklang
_pkgname=cookcli
_appname=cook
pkgname=${_pkgname}-bin
pkgver=0.38.1
pkgrel=1
pkgdesc="Command line program which provides a suite of tools to create shopping lists and maintain recipes."
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_appname}")
conflicts=("${_pkgname}" "${_pkgname}-git")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md"
        "CONTRIBUTING-${pkgver}.md::${_urlraw}/CONTRIBUTING.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_appname}-${arch[0]}-unknown-linux-musl.tar.gz")
source_i686=("${_appname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_appname}-${arch[1]}-unknown-linux-musl.tar.gz")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_appname}-${arch[2]}-unknown-linux-musl.tar.gz")
sha256sums=('af27681b98fd4549e7966762a119a1bd90c5ea547b42964da2407d7678dc6ddf'
            '67047e40fe43969798fcfd576d9dac84b5d3ec1a42f979d70e08470a1c1e1188'
            'beab572c9bdbfe5e6a6cb391e1962d52adf5b2a4e5f258062a8eb21acf9ffd64'
            '4f6e8d546735542d5ca9fe8d9120146e31e7b2d558ffd9f5a22af08c9183e0a8')
sha256sums_x86_64=('558303e1d31afccd6a75f987a04f0e0d6b8064a33ea99d87c4683ffe5bff078c')
sha256sums_i686=('f4e2d9e2ca75edcb86ab5c42ec2ffbc265aa7fcf0e428666c8d168b16de8332a')
sha256sums_aarch64=('aa523d9bda1e931dae06fd7cef87646a3a21319f3d4d8517b6e7b5a2e665b909')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "CONTRIBUTING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
}
