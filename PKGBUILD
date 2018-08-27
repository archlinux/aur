# Maintainer: Robinhuett <aur at tripp dot xyz>

pkgname=kiss-gui
arch=(x86_64)
pkgver=2.0.11
pkgrel=1
_commit=46e13e7
pkgdesc="The KISS GUI is the crossplatform configuration tool for the Flyduino flight control system like the KISSfc, KISScc and KISSfcV2F7"
url="https://github.com/flyduino/kiss-gui"

source=("$url/releases/download/$pkgver/KISS-GUI_$pkgver-master_$_commit-linux64.zip"
        "https://raw.githubusercontent.com/flyduino/kissfc-chrome-gui/master/images/icon_128.png"
        "$pkgname.sh"
        "$pkgname.desktop")
sha512sums=('db8277486619d3fd2ae9f383c85770d9954c07a875cfcf8829fad0c63bfc3ac712145c5bef9d58c8dacfa7312cfd1be1aef6dc6aee362dab033828c584e84c74'
            '36af702cf64bc0606eaf01febd3ed7db47e327bfb68f10f23f65d36b9a9482038e22149711d5b1fbbeabc1a6fcef9de25e971aa7f67b475983fd9aa3c57ca22f'
            '7aaaeb1688560a0874e69455ce25f273fa03aa5ad3a41116f4a71cde49ccfe334c05c955384e3624f5a7fca1300461eec41540cd05a7d61a3343dac09b576497'
            '5a43483c365a1b1134bdd176be481a0400d3807b270cf0a31a575d5a7b0de167db6d1cd182ee9443cc0c86c77fbe14bb66bb1147c230f994aab36540687536ae')
options=(!strip)

package() {
  cd KISS-GUI
  install -d "$pkgdir/usr/share/$pkgname/"
  cp -a * "$pkgdir/usr/share/$pkgname/"

  install -D "$srcdir/icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  install -D "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -d "$pkgdir/usr/bin/"
  install -Dm 755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

