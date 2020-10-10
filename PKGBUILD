# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=pwvault
pkgver=0.9.37
pkgrel=2
pkgdesc='GPG-based, commandline get keepassx password'
url='https://github.com/cdede/pwvault/'
arch=('any')
license=('GPL3')
depends=('python-kppy')
conflicts=('lewm' 'lewm-git' 'pwvault-git')
replaces=('lewm')
source=("https://github.com/cdede/pwvault/archive/${pkgver}.tar.gz")
sha256sums=('3002234b0ed75cea9ccb54a83c730385971e44ae3e8145fa70c5431528516984')

build() {
  cd  ${srcdir}/*${pkgname}*/
  python setup.py build
}
package() {
  cd  ${srcdir}/*${pkgname}*/
  python setup.py install --root="$pkgdir/" --optimize=1
}
