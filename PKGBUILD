# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Sebastian Rutofski <kontakt@sebastian-rutofski.de>

_pkgauthor=cooklang
_pkgname=cookcli
_appname=cook
pkgname=${_pkgname}-bin
pkgver=0.13.0
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
source_x86_64=("${url}/releases/download/v${pkgver}/${_appname}-${arch[0]}-unknown-linux-musl.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_appname}-${arch[1]}-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_appname}-${arch[2]}-unknown-linux-musl.tar.gz")
sha256sums=('af27681b98fd4549e7966762a119a1bd90c5ea547b42964da2407d7678dc6ddf'
            '613f7aa992b7791a34749017b518ecde93cb42ca565c9a519488b5d66a95b5b2'
            'c30b2548ded19a28a4a9e0ce67fcbde72e0b013e75873e7ffa34416dcffd9bf2'
            '895f3cb817617cf3851cafc8f70d919c2274b3b5a8b4a584d682ca892c10bf8e')
sha256sums_x86_64=('046b1b7759307e8e808d46952bb07046c11b189c69b8ca805cd5203bfb097807')
sha256sums_i686=('902d07858d209ea8704e430ccbafe94c792593359100b2a088669cbf99850e26')
sha256sums_aarch64=('4040ef6fe59d2ee07e6ad93881bc2e85c29bd86b2265e4c6ada757d07e859b49')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "CONTRIBUTING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
}
