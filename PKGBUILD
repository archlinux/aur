# Maintainer: Integral <integral@member.fsf.org>

pkgname=xapkdetector-bin
_pkgname=xapkdetector
pkgver=0.03
pkgrel=1
pkgdesc="An Android/APK/DEX detector."
arch=('x86_64')
url="https://github.com/horsicq/XAPKDetector"
license=('MIT')
depends=('hicolor-icon-theme' 'qt5-base')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
	"${_pkgname}-${pkgver}_amd64.deb::https://github.com/horsicq/XAPKDetector/releases/download/${pkgver}/${_pkgname}_${pkgver}_Debian_11_amd64.deb"
	"https://raw.githubusercontent.com/horsicq/XAPKDetector/refs/tags/${pkgver}/LICENSE"
)
sha512sums=('5b5ba62e42d5ad14d3f0995426e417d8937619d4096f25853c2615c323a9cfcb958bd13d301df20a3bf702ea9154d7a16eb42fc88664f1a8bd871a1a6924941d'
            '14858fd3967f85479011f5307cbe06ec8413a1154ac176ae37102f112d99f44f540ab66f2a62497067a669c88e86966b31cb82dd125dad3850f9fed56e43a518')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xvf data.tar.xz -C "${pkgdir}/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
