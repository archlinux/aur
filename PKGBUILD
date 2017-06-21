# Maintainer: 0strodamus <0strodamus at cox dot net>
# Contributor: TDY <tdy@archlinux.info>

pkgname=poptrayminus
pkgver=1.2.0
pkgrel=1
pkgdesc="A POP3 mailbox monitor with tray icon notifications"
arch=('any')
url="http://server-pro.com/poptrayminus/"
license=('GPL3')
depends=('python2-chardet' 'python2-pyqt4')
source=("http://server-pro.com/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e997dd3230e0d6f14212611e8ecc34f9f5b7cc2865e8d031781998b3ce7c8d50')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  # add more mail check time intervals
  #sed -e 's|5, 10, 15, 20, 30, 40, 60|5, 10, 15, 20, 30, 40, 60, 90, 120, 240|g' -i poptrayminus
  python2 setup.py build
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
