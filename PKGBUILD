# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Sebastian Rutofski <kontakt@sebastian-rutofski.de>

_pkgauthor=cooklang
_pkgname=cookcli
_appname=cook
pkgname=${_pkgname}-bin
pkgver=0.17.1
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
            'ad1bf67236d1e3977919b55641e809408134b4d8c1d8dfac2d6f3568834848e0'
            '3d67eddf268ec392cfb81556403e264f420ad4f94d72ea4ba954b739ccc0e2c8'
            '767934c9667ffa2d10332e8db98e363ffa042f2f790f16c2e42563671fd15244')
sha256sums_x86_64=('89016da8aba3a8830020787b9dcc22cbb61101255ab04e3f93dbbd8a8a3aa852')
sha256sums_i686=('394ac30cdfaee38a554cc7f894177cf752bd355dfde2ff706800cb1f70507340')
sha256sums_aarch64=('1cd3e7c5fb310b0a5cdaae2d61e86a1d3a92623477680b9029195fbcd268e6f6')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "CONTRIBUTING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
}
