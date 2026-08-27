# Maintainer: Frederik Enste <frederik at fenste dot de>

_pkgname=materialize
pkgname=${_pkgname}-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Image to Material tool (fork by maikramer)."
arch=(x86_64)
url="https://github.com/maikramer/Materialize"
license=('GPL')
provides=("${_pkgname}=${pkgver}", "${pkgname}=${pkgver}")
depends=()
makedepends=()
options=('!debug')
source=("https://github.com/maikramer/Materialize/releases/download/v${pkgver}/Materialize-v${pkgver}.Linux64.tar.xz"
        "https://raw.githubusercontent.com/maikramer/Materialize/refs/tags/v${pkgver}/LICENSE"
	"materialize-bin.desktop")
sha256sums=('3e1231a8dae5846949c516db51fc077752ec4083aa8b5521afc0ba2dc5e38cdf'
	    '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '36d0b1add93736a0e0759d4874e493b1a412616667b64cc5cb6e7188c1a9c082')

package() {
	install -Dm 644 ${srcdir}/LICENSE "${pkgdir}/opt/${_pkgname}/LICENSE.txt"

	install -Dm 755 ${srcdir}/Materialize-v${pkgver}.Linux64.x86_64 "${pkgdir}/opt/${_pkgname}/Materialize-v${pkgver}.Linux64.x86_64"
	cp -a  ${srcdir}/Materialize-v${pkgver}.Linux64_Data "${pkgdir}/opt/${_pkgname}/Materialize-v${pkgver}.Linux64_Data"
	install -Dm 755 ${srcdir}/UnityPlayer.so "${pkgdir}/opt/${_pkgname}/UnityPlayer.so"

	install -Dm 644 ${srcdir}/materialize-bin.desktop "${pkgdir}/usr/share/applications/materialize.desktop"
}
