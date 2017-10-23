# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Pascal Wittmann <mail@pascal-wittmann.de>

pkgname=lorem-ipsum-generator
pkgver=0.3
pkgrel=4
pkgdesc="Generates random lorem ipsum text"
arch=('any')
url='http://code.google.com/p/lorem-ipsum-generator/'
license=('BSD')
makedepends=('python2-distribute' 'python2' 'pygtk' 'gtk2')
depends=('python2-setuptools')
options=(!emptydirs)
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('15839e29fdc7aa0d504a3c965ef9824050cd929fb92e3845247a6940411c8c41')

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/ --optimize=1
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
