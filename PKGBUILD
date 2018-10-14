# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=krop
pkgver=0.5.0
pkgrel=1
pkgdesc="A tool to crop PDF files, with an eye towards eReaders."
arch=('any')
url="http://arminstraub.com/computer/krop"
license=('GPL3')
depends=('python' 'python-poppler-qt5' 'python-pypdf2' 'python-pyqt5')
source=("$pkgname-$pkgver.tar.gz::https://github.com/arminstraub/krop/archive/v${pkgver}.tar.gz")
sha256sums=('25c67095d0416ee1359d16dd106bd828deb01825a9cbe342e89c7e007b7f43a2')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root $pkgdir

  # Desktop icon
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
