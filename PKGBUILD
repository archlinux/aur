# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="rescribe-ocr"
pkgname="$_pkgname-wayland-bin"
conflicts=(
    "$_pkgname"
    "$_pkgname-wayland-bin"
)
pkgver=1.3.0
pkgrel=1
pkgdesc="An easy-to-use desktop tool for performing OCR on image files, PDFs and Google Books (Wayland Build)"
arch=('x86_64')
url="https://rescribe.xyz/"
license=('GPL-3.0')
depends=('leptonica' 'tesseract')
source=(
	"rescribe::https://rescribe.xyz/rescribe/1.3.0/linux/wayland/rescribe"
	"https://raw.githubusercontent.com/rescribe/bookpipeline/refs/heads/master/cmd/rescribe/xyz.rescribe.rescribe.desktop"
	"https://raw.githubusercontent.com/rescribe/bookpipeline/refs/heads/master/cmd/rescribe/icon.256.png"
	"https://raw.githubusercontent.com/rescribe/bookpipeline/refs/heads/master/cmd/rescribe/icon.svg"
)
noextract=("rescribe")
options=(!strip)
sha256sums=('2bbb6bd5207f484dc10b790681babadaa2c6a148209912856525a9d3d29a9272'
            '3ec44d736f4bbaaabb760d61d2aeea2997d5e4ba1c47d3b252788472a53ef531'
            '38d2fa56b8f950df3b5653a9cfe949aea846327aa16165bb1c495294deee41d7'
            'df0b29c72b3d0b4041c882d45c4f7895966c7d6acd307dc4e0e939036a959316')

package() {
    install -Dm755 "${srcdir}/rescribe" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "${srcdir}/xyz.rescribe.rescribe.desktop" "$pkgdir/usr/share/applications/xyz.rescribe.rescribe.desktop"
    install -Dm644 "${srcdir}/icon.256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/xyz.rescribe.rescribe.png"
    install -Dm644 "${srcdir}/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/xyz.rescribe.rescribe.svg"
}
