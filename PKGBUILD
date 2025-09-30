# Maintainer: macaquinyo <miamigoelmacaco@proton.me>
# Contributor: 
pkgname=yomikiru-bin
pkgver=2.21.2
pkgrel=1
pkgdesc="An offline desktop reader for manga, comics, webtoons, and novels. Offers a customizable reading experience with extensive settings, shortcuts, themes and layouts."
arch=('x86_64')
url="https://github.com/mienaiyami/yomikiru"
license=('MIT')
depends=('gtk3' 'nss' 'libxtst' 'at-spi2-core' 'libdrm' 'mesa' 'libxcb' 'xdg-utils' 'alsa-lib')
provides=('yomikiru')
conflicts=('yomikiru' 'yomikiru-git')
optdepends=('unzip: .cbz support')
options=('!emptydirs' '!debug' '!lto')
install=${pkgname}.install
source_x86_64=("https://github.com/mienaiyami/yomikiru/releases/download/v${pkgver}/Yomikiru-v${pkgver}-amd64.deb")
sha512sums_x86_64=('5ed6be6375978664281f95b01547d05e4ac3acf88ec574d8fab531456807f5f06331df8cf7b8ab13467c563e3ca4c902a9516533195cca4b3b2e61f85aa123be')

package(){
	# Extract package data
	bsdtar -xf data.tar.zst -C "$pkgdir/"
	install -D -m644 "${pkgdir}/usr/lib/yomikiru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/yomikiru/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
