# Contributor: Kim Scarborough <sluggo@unknown.nu>

pkgname=treeline
pkgver=3.1.1
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
sha256sums=('4bfd428a9ac6c1a9a1d28c3b4663ae44b80a5496e9e7b955354b93400aa6e8c5'
            '2b23717127a37888499bddf62042eddb800d58b10ec88f3f54a538c8e24b19d6')

package() {
  install -Dm644 treeline.xml      "${pkgdir}/usr/share/mime/packages/x-treeline.xml"
  cd "${srcdir}/TreeLine"
  python install.py -p /usr -b  "${pkgdir}"
  install -Dm644 treeline.desktop  "${pkgdir}/usr/share/applications/treeline.desktop"
}
