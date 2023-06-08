# Maintainer: Anton Filimonov <anton.filimonov@gmail.com>

pkgname=klogg-git
pkgver=23.06.0.1408
_subversion=0
pkgrel=1
pkgdesc="A multi-platform GUI application that helps browse and search through long and complex log files. It is designed with programmers and system administrators in mind and can be seen as a graphical, interactive combination of grep, less, and tail"
arch=('x86_64')
url='https://klogg.filimonov.dev'
license=('GPL3')
provides=('klogg')
conflicts=('klogg')
depends=('qt5-base' 'hicolor-icon-theme')

source=("https://github.com/variar/klogg/releases/download/continuous-linux/klogg_version.txt"
        "https://github.com/variar/klogg/releases/download/continuous-linux/klogg_bin.tar.gz")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cat klogg_version.txt
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mv "${srcdir}/klogg" "${pkgdir}/usr/bin"
  chmod 755 "${pkgdir}/usr/bin/klogg"
}

