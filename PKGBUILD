# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=qshntoolsplit
pkgver=0.0.1
pkgrel=5
pkgdesc="Split cue/media files with a graphical shntool based utility"
arch=('x86_64')
#url="http://www.qt-apps.org/content/show.php/QShnToolSplit?content=110373"
url="https://aur.archlinux.org/pkgbase/qshntoolsplit/"
license=('GPL3')
depends=('qt4' 'shntool' 'xterm')    # 'cuetools'
optdepends=('flac: for flac support' 'mac: for ape support')
#source=(QShnToolSplit-$pkgver.tar::https://dl.opendesktop.org/api/files/download/id/1466642797/s/b9cff0ab278a03eb2437961990895a1b/t/1539105735/u//110373-QShnToolSplit-0.0.1.tar.gz
source=(QShnToolSplit-$pkgver.tar
        QShnToolSplit.desktop)
sha256sums=('f8c3bf7dc9042272e6ac49ff44d4e3d2c31952589c77087a13249cd32b6f4efd'
            'd820bfedb8e0fe649527d27ac50d39483699885414db94ea367397be99e64eaa')

build() {
  cd QShnToolSplit-$pkgver
  qmake-qt4
  make
}

package() {
  install -Dm644 QShnToolSplit.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 QShnToolSplit-$pkgver/QShnToolSplit "$pkgdir/usr/bin/qshntoolsplit"
}

