# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=rep
_pkgauthor=baalimago
_pkgname=repeater
pkgname=${_appname}-bin
pkgdesc="xargs, but different..! Better at some things (repeating stuff), worse at others (not repeating stuff)."

pkgver=1.2.8
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('linux-amd64' 'linux-386' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[0]}_${_pkgvername}")
source_i686=("${_appname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[1]}_${_pkgvername}")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[2]}_${_pkgvername}")
sha256sums=('c9587acf415800a7a5eaf2ed937e196fa83268bd97642d37f3ce47f3d8e773c7'
            'bc5378230a80daace8ac9ea68f538fb33997fd2abf0fa5d91905365b6b8924dc')
sha256sums_x86_64=('77b09af388950fc1fa31e888a794d5ca150a54646d0ca18ff771b1e8e3a5751d')
sha256sums_i686=('2834abbd5d0c0a722b65b9f6cd12447a61e8b31bea4b06d85d2a4930424a0fe1')
sha256sums_aarch64=('a5178ccaf1c659cae0e2e606ff40402d82658a46b82f1e02bb161f3f166aa48f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
