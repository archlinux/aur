# Maintainer: macaquinyo <miamigoelmacaco@proton.me>
# Contributor: 
pkgname=yomikiru-bin
pkgver=2.21.1
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
sha512sums_x86_64=('157719ab72a8a6d64a015fd6ac7405997464fc75f4344a302f74ac8598cb22e7f8ca49c39b405d6a0f29f4e4578e32217289bac06fa13c37594fab57c271f2ed')

package(){
	# Extract package data
	bsdtar -xf data.tar.zst -C "$pkgdir/"
	install -D -m644 "${pkgdir}/usr/lib/yomikiru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/yomikiru/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
