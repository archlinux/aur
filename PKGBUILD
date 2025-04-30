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
sha512sums_x86_64=('8575970a080672f9fb374c470b91122c931d68ebe595989017416eae854715a4')
sha512sums_x86_64=('eaea7eb3275a42cf38b18b11349bf7265de0d0491135033345d2e0e344e32129aab753c1a47ee081c4b70885b00c2d6b088b31d776167383a6883db49c8cba2b')

package(){
	# Extract package data
	bsdtar -xf data.tar.zst -C "$pkgdir/"
	install -D -m644 "${pkgdir}/usr/lib/yomikiru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/yomikiru/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
