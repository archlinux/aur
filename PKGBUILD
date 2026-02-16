# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Sebastian Rutofski <kontakt@sebastian-rutofski.de>

_pkgauthor=cooklang
_pkgname=cookcli
_appname=cook
pkgname=${_pkgname}-bin
pkgver=0.23.0
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
            'eee1f1915889d81f572029408669a312c5b124b54f0d7196ef4b66dd12651d88'
            'b8fbaad1f478a35d95c7f6ba4c69d1fd43979eab88777b43e2370edd5b43e524'
            '767934c9667ffa2d10332e8db98e363ffa042f2f790f16c2e42563671fd15244')
sha256sums_x86_64=('59930ae5c6b40d017cc2e81de663821aac3105fb7f710e8c8dba55244c0a6859')
sha256sums_i686=('65ac3fbfdd8e70dc97da483698cab4400e8c6db953c27546e0a0a455f142ef29')
sha256sums_aarch64=('010f8b212ec6ab38582840e509b37735467ff643391de91d241d72db13a20eb2')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "CONTRIBUTING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
}
