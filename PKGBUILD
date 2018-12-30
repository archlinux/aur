# Contributor: Kim Scarborough <sluggo@unknown.nu>

pkgname=treeline
pkgver=3.0.3
pkgrel=1
pkgdesc="Outliner and PIM which stores information in a tree structure"
arch=('any')
url="http://treeline.bellz.org/";
license=('GPL2')
depends=('python-lxml' 'python-pyqt5')
optdepends=('aspell' 'ispell' 'hunspell')
conflicts=('treeline-unstable')
source=("https://github.com/doug-101/TreeLine/releases/download/v${pkgver}/treeline-${pkgver}.tar.gz"
	"treeline.xml")
sha256sums=('9591b439ecb7596fc44f0795c776918fc98af4db53c6bb68b7feb3d2108461c0'
            '2b23717127a37888499bddf62042eddb800d58b10ec88f3f54a538c8e24b19d6')

package() {
  install -Dm644 treeline.xml      "${pkgdir}/usr/share/mime/packages/x-treeline.xml"
  cd "${srcdir}/TreeLine"
  python install.py -p /usr -b  "${pkgdir}"
  install -Dm644 treeline.desktop  "${pkgdir}/usr/share/applications/treeline.desktop"
}
