# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=krop
pkgver=0.6.0
pkgrel=1
pkgdesc="A tool to crop PDF files, with an eye towards eReaders."
arch=('any')
url="http://arminstraub.com/computer/krop"
license=('GPL3')
depends=('python' 'python-pypdf2' 'python-pyqt5' 'python-sip' 'python-poppler-qt5')
makedepends=('sip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/arminstraub/krop/archive/v${pkgver}.tar.gz")
sha256sums=('97022416ec4f2ff70e0ab38d3f3aaff83a68dca99f3e273c29e9f3dd72bf88d9')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root $pkgdir

  # Desktop icon
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  
  # fix executable
  sed -i "s|krop==0.6.0|krop|g" $pkgdir/usr/bin/krop
}
