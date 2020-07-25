# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=kit
pkgver=153
pkgrel=1
pkgdesc="The Kinesics Text Editor is a small, fast, efficient, portable text editor"
arch=('x86_64')
url='https://turtlewar.org/projects/editor'
license=("custom:${pkgname}")
depends=('ncurses5-compat-libs')
source=("${pkgname}-${pkgver}.tar.gz::https://turtlewar.org/projects/editor/kit-${pkgver}-lin.tar.gz")
sha256sums=('116b35a3ab779270217a42fb35866d456c73eaa950c6a8e1f0d8f34370f01161')

package() {
  cd "${pkgname}-${pkgver}-lin"
  install -Dm644 editor-license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 editor-briefkeys.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 editor-config.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 editor-readme.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 editor-keymap.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 k.cfg -t "${pkgdir}/etc/${pkgname}"
  install -Dm755 x64/k -t "${pkgdir}/usr/bin"
}