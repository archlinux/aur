# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=qt5-feedback
pkgver=0.0.0.20150918
_commit=28ca62414901502189ea28ef2efd551386187619
pkgrel=6
pkgdesc="Qt Tactile Feedback Add-on Module"
arch=('x86_64' 'i686' 'pentium4')
url="https://github.com/qtproject/qtfeedback"
license=('GPL3' 'LGPL' 'FDL' 'custom')
depends=('qt5-declarative')
makedepends=('git')
source=("git+https://github.com/qtproject/qtfeedback.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd qtfeedback

  qmake-qt5
  make
}

package() {
  cd qtfeedback

  make INSTALL_ROOT="${pkgdir}" install

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}
