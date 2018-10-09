# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=qshntoolsplit
pkgver=0.0.1
pkgrel=5
pkgdesc="Split cue/media files with a graphical shntool based utility"
arch=('x86_64')
url="http://www.qt-apps.org/content/show.php/QShnToolSplit?content=110373"
license=('GPL3')
depends=('shntool' 'qt4' 'xterm')    # 'cuetools'
optdepends=('flac: for flac support' 
            'mac: for ape support')
source=(QShnToolSplit-$pkgver.tar::'https://dl.opendesktop.org/api/files/download/id/1466642797/s/b9cff0ab278a03eb2437961990895a1b/t/1539105735/u//110373-QShnToolSplit-0.0.1.tar.gz'
	    QShnToolSplit.desktop)
md5sums=('c61a3c11bfb6e9fa90d3ca4d761841a3'
         '0126d6608d8c2905873089b1b04eed34')

build() {
  cd QShnToolSplit-$pkgver
  qmake-qt4
  make
}

package() {
  install -Dm644 QShnToolSplit.desktop "$pkgdir/usr/share/applications/QShnToolSplit.desktop"

  cd QShnToolSplit-$pkgver
  install -Dm755 QShnToolSplit "$pkgdir/usr/bin/qshntoolsplit"
}

