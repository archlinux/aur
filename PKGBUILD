# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=krop
pkgver=0.5.1
pkgrel=2
pkgdesc="A tool to crop PDF files, with an eye towards eReaders."
arch=('any')
url="http://arminstraub.com/computer/krop"
license=('GPL3')
depends=('python' 'python-pypdf2' 'python-pyqt5' 'python-sip' 'python-poppler-qt5')
makedepends=('sip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/arminstraub/krop/archive/v${pkgver}.tar.gz")
sha256sums=('a5352c38c68348b889aa7a9f1bcbbe4bf0c761de60e2817bcc48d4d3eec8aff6')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root $pkgdir

  # Desktop icon
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
