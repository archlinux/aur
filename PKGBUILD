# Maintainer: Oliver Mader <b52@reaktor42.de>
pkgname=mitk-bin
pkgver=2016.11.0
pkgrel=1
pkgdesc='Medical Imaging Interaction Toolkit (MITK) is a free open-source software system for development of interactive medical image processing software.'
arch=('i686' 'x86_64')
url='http://mitk.org'
license=('BSD3')
depends=('libxnvctrl' 'qt5-tools' 'qt5-webkit')
source=("http://www.mitk.org/download/releases/MITK-2016.11/Linux/MITK-2016.11.0-linux64.tar.gz"
        "mitk-workbench"
	"mitk-workbench.desktop")
md5sums=('ceb17c4813d269878f1909d172417d21'
         '94d6bfecbc75195a38eced4dd8ff28bc'
         '225b216d2e924488f10e6927a820a299')

options=(!strip)

package() {
  mkdir "$pkgdir/opt"
  cp -r "$srcdir/MITK-2016.11.0-linux64/bin/" "$pkgdir/opt/MITK-2016.11.0"
  rm -f $pkgdir/opt/MITK-2016.11.0/libQt5*
  chmod 644 $pkgdir/opt/MITK-2016.11.0/lib*
  install -Dm755 "$srcdir/mitk-workbench" "$pkgdir/usr/bin/mitk-workbench"
  install -Dm644 "$srcdir/mitk-workbench.desktop" "$pkgdir/usr/share/applications/mitk-workbench.desktop"
}

