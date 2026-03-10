# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=rep
_pkgauthor=baalimago
_pkgname=repeater
pkgname=${_appname}-bin
pkgdesc="xargs, but different..! Better at some things (repeating stuff), worse at others (not repeating stuff)."

pkgver=1.2.6
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
sha256sums=('0a490de6d4d5353a98d84ed640cf5e0c50605f170e2e618c9d62a983aa844314'
            'bc5378230a80daace8ac9ea68f538fb33997fd2abf0fa5d91905365b6b8924dc')
sha256sums_x86_64=('5a6f68f6c2f131790b198d8729fb46aa37cc35bcdf09dd2d67beba5973e37d7c')
sha256sums_i686=('e72981654010681342eca2417427dfd2494c6efe38e55fe69658e9c2a01059f8')
sha256sums_aarch64=('4a6c1c85b80661789cbb17a8d93a0e659ccfc069ec3a8f701fcd2e55888c46b2')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
