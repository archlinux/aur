# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
pkgname=affenspiel
pkgver=1.0
pkgrel=2
pkgdesc="It's a puzzle type game for X11."
arch=('any')
url="https://www.artsoft.org/affenspiel/"
license=('GPL')
makedepends=('libx11' 'libxt')
provides=(${pkgname})
options=()
source=(
  "https://www.artsoft.org/RELEASES/unix/affenspiel/${pkgname}-${pkgver}.tar.gz"
  "${pkgname}.desktop"
  "${pkgname}.png"
)
sha512sums=(
  '2ce3b27ffe534cb8479c6ab61e8123f9ccee455b3eb7552e7e68c4cecbc9cfca0ae46dd9c5cb12e613aac49f59fe865c5f06490489a96a915a8c2b06ba24afd4'
  'bcb6755c8a4f4bc5bfdb26630b8c7dd22057e005d9d9f04b8b6843df4f193fd17e9c301ef41211045b5b4b2aa8315a4a7ff62686a35a30d7b80f4722ae526369'
  '52e4550fdec6f853205d240903da8e36c9b464c52dc54f6e784388becebc19d05b6fa598cd99f4d3d78daf5e39609dc5891e41ad2bff9aa9939cf4dc63de68d1'
)
build() {
	cd "${srcdir}"/"${pkgname}"
	make
}

package() {
	cd "${srcdir}"/"${pkgname}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
  mkdir -p "${pkgdir}/usr/share/applications/"
	install -Dm755 "${pkgname}" "${pkgdir}"/usr/bin
	install -Dm644 README "${pkgdir}"/usr/share/doc/${pkgname} 
  install -Dm644 "${startdir}/${pkgname}.png" ${pkgdir}/usr/share/icons/hicolor/72x72/apps/${pkgname}.png
  install -Dm644 "${startdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
