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
source=(QShnToolSplit-$pkgver.tar::'https://www.opendesktop.org/p/1131540/startdownload?file_id=1466642797&file_name=110373-QShnToolSplit-0.0.1.tar.gz&file_type=application/x-gzip&file_size=5214&url=https%3A%2F%2Fdl.opendesktop.org%2Fapi%2Ffiles%2Fdownload%2Fid%2F1466642797%2Fs%2Fd46f34660fd69410f43043a8205b711a%2Ft%2F1538900269%2Fu%2F%2F110373-QShnToolSplit-0.0.1.tar.gz'
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

