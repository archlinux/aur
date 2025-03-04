# Maintainer:Integral <integral@member.fsf.org>

pkgname=xelfviewer-bin
_pkgname=xelfviewer
pkgver=0.05
pkgrel=2
pkgdesc="ELF file viewer/editor."
arch=('x86_64')
url="https://github.com/horsicq/XELFViewer"
license=('MIT')
depends=('hicolor-icon-theme' 'qt5-base')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
	"${_pkgname}-${pkgver}_amd64.deb::https://github.com/horsicq/XELFViewer/releases/download/${pkgver}/${_pkgname}_${pkgver}_Debian_11_amd64.deb"
	"https://raw.githubusercontent.com/horsicq/XELFViewer/refs/tags/${pkgver}/LICENSE"
)
sha512sums=('fd35a7aa8a886fd02d88592a8b633c3b0c88591553c4abfe7f1895232682cacb04c4a011a18ff26cc06b86174752ff79c5d14c3b2d9a2eb9c089385874228fdd'
            'f572cbf7badfe310fba316d422df2f9f28fdf5ada41fe03f262abb3333d1c3b2e0aa6e0aa2e5ec61b1d273a90da0e4af57c16ac301a468d2323cb5df37095ee5')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xvf data.tar.xz -C "${pkgdir}/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
