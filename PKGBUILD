# Maintainer: macaquinyo <miamigoelmacaco@proton.me>
# Contributor: 
pkgname=yomikiru-bin
pkgver=2.20.0
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
sha512sums_x86_64=('4679040282ad8f6baa4d5fef9a9443bd07e1e0d57b1ebc5ec8f1c0253b6280454678df3c7421b3f339a266cd95feb7828523d447b6a038b7145b3ffa722f5e4b')

package(){
	# Extract package data
	bsdtar -xf data.tar.zst -C "$pkgdir/"
	install -D -m644 "${pkgdir}/usr/lib/yomikiru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/yomikiru/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
