# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ralsina
_pkgname=markterm
pkgname=${_pkgname}-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="A terminal markdown renderer"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-${_barch[0]}")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-${_barch[1]}")
sha256sums=('dbbffa23a676d422aa7460b468c731e4fe3a007414e14d787a3d3f3fb55b1713'
            '0a3a1ef990d1b713f9245123497916ba6dd5537a8a1b21675aeebb7c6cfa81aa'
            '3b47ce65817cc81abc346825fb43b3bdb8a7723a39eccff4b5977eb8a896d52a')
sha256sums_x86_64=('4da82590e2bd18eb550cb9b3888d98615e4297ac6e10901360d4475becd35518')
sha256sums_aarch64=('d568e620d792e41539fbde7c50806c0df4d7471b592bc5a438aee1437b167974')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-static-linux-"* "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
