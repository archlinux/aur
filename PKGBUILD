# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Sebastian Rutofski <kontakt@sebastian-rutofski.de>

_pkgauthor=cooklang
_pkgname=cookcli
_appname=cook
pkgname=${_pkgname}-bin
pkgver=0.41.1
pkgrel=1
pkgdesc="Command line program which provides a suite of tools to create shopping lists and maintain recipes."

license=('MIT')
arch=('x86_64' 'i686' 'aarch64')
_barch=('linux-x86_64-musl' 'linux-i686-musl' 'linux-aarch64-musl')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

provides=("${_appname}")
conflicts=("${_pkgname}" "${_pkgname}-git")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md"
        "CONTRIBUTING-${pkgver}.md::${_urlraw}/CONTRIBUTING.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_i686=("${_appname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}-${_barch[2]}.tar.gz")
sha256sums=('af27681b98fd4549e7966762a119a1bd90c5ea547b42964da2407d7678dc6ddf'
            'f2180f152aac082d564b5df811d59719e1c384ae76a6a3025c5dae430ccc6269'
            '6d5183f294eed94c35a92ff2db2eacf3fd590c743ee25288ec54801a2c7f1ec1'
            '4f6e8d546735542d5ca9fe8d9120146e31e7b2d558ffd9f5a22af08c9183e0a8')
sha256sums_x86_64=('342378f8121ba8b12cb13654119348860001bb3ab07ca00ba65f59ad00b51354')
sha256sums_i686=('e690733fe185e527084cbc44755a5dbb4876384dc4714569d85d47c4e87c3044')
sha256sums_aarch64=('3502b5048fab6226449bec881988a459dc67415cf0016479a103759e4f08eb82')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "CONTRIBUTING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
}
