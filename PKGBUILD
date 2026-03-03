# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Sebastian Rutofski <kontakt@sebastian-rutofski.de>

_pkgauthor=cooklang
_pkgname=cookcli
_appname=cook
pkgname=${_pkgname}-bin
pkgver=0.24.0
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
            '2d4a2ef138afd258f34599dcd96ff91a5997e86bfa591707e335e2838b31a6a6'
            '36ce0a3d778e4e4663fb6a59aa7d88285b305bbb5007ec6fb0422d9d17c5018f'
            '767934c9667ffa2d10332e8db98e363ffa042f2f790f16c2e42563671fd15244')
sha256sums_x86_64=('fdd36a952525b4430285714c7572a2e4e1aaad3b90f8d2c0955b05080e22e4f8')
sha256sums_i686=('5a819932a330c02b20f68d73127372b3e186491870f56411e512b2192c3ef330')
sha256sums_aarch64=('f6a362394db79162590c55d393cb168fbf28b61d842483b4e8087065b5586195')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "CONTRIBUTING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
}
