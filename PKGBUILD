# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Sebastian Rutofski <kontakt@sebastian-rutofski.de>

_pkgauthor=cooklang
_pkgname=cookcli
_appname=cook
pkgname=${_pkgname}-bin
pkgver=0.40.0
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
            '3daba5f9f2ccd68f015da7f3567092b0cc8da07f7b8ed3fa66eca96ddda412e6'
            '4f6e8d546735542d5ca9fe8d9120146e31e7b2d558ffd9f5a22af08c9183e0a8')
sha256sums_x86_64=('50976c7261dbd5bc18d0f6d83ec3445801863c1d416c4f17f4be5411529c045d')
sha256sums_i686=('27a58c7cafece213def415c0358e80a99f884e6cba06d87a12f1e81bec1880b6')
sha256sums_aarch64=('35ba55495644b4fc81bb66646d72995adecab732163ae1a8f4f21614b186cb69')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "CONTRIBUTING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
}
