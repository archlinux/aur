# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dlvhdr
_pkgname=gh-enhance
pkgname=${_pkgname}-bin
pkgver=0.8.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A Blazingly Fast Terminal UI for GitHub Actions"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_linux-${_barch[0]}")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_linux-${_barch[1]}")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_linux-${_barch[2]}")
sha256sums=('470262b78436bb4cd3a18cdedc735479a6738bb599b648bc295346c499bce33d'
            '2963ff8f76a7cb32c80021856e4626c6fee8a8e48c1c32cb8c21ed2705dc3b44')
sha256sums_x86_64=('25812ea8781d22b2758823ca9d18751a4c55d623cb54fda219db5389beb65660')
sha256sums_i686=('ab8bfb7b414d602fa0c7d81d2b920f1615b0212ac34c6d4cfdf9be0d67498fb9')
sha256sums_aarch64=('f1659e48cb6005709def38f2848faf787f3dd292a3841e341fb5b8a2493c6c84')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
