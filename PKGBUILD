# Maintainer: macaquinyo <miamigoelmacaco@proton.me>
# Contributor: 
pkgname=yomikiru-bin
pkgver=2.22.5
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
sha512sums_x86_64=('83d96ffab1f9a94116d385f453f708f0eee4d0a0878e34e3ed981299e5f9296a2118b33188d4e9ff6bb452587176aa6c8981a30e974e09cb057c8529e283e2a0')

package(){
	# Extract package data
	bsdtar -xf data.tar.zst -C "$pkgdir/"
	install -D -m644 "${pkgdir}/usr/lib/yomikiru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/yomikiru/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
