# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dlvhdr
_pkgname=gh-enhance
pkgname=${_pkgname}-bin
pkgver=0.5.0
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
sha256sums=('b498bef6b086a281ec3b24924054719fcdc8ecf2d4c7fa0c2b97f578d4c50e87'
            '2963ff8f76a7cb32c80021856e4626c6fee8a8e48c1c32cb8c21ed2705dc3b44')
sha256sums_x86_64=('2912907590f5a3a9d7e6c6539400f674174479a86577c9eb7b6df2400f6eeed4')
sha256sums_i686=('af278f6193df5be76088b966da8c21c71b693b8274a2c6cea5269afc1b4e7026')
sha256sums_aarch64=('7b7b14965e1b0530ec850438e57ce26656e46cb4203684edb00a6264093a451a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
