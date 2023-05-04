# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Alexander Scharinger
# Contributor: Tristan Webb <t2webb@ucsd.edu>
# Contributor Sindwiller

pkgname=pyspread
pkgver=2.2.1
pkgrel=1
pkgdesc="Python based non-traditional spreadsheet application"
arch=('any')
url="https://pyspread.gitlab.io/"
license=('GPL3')
depends=('python-setuptools'
        'python-dateutil'
        'python-numpy>=1.1.0'
        'python-pyqt5'
        'qt5-svg'
        'python-markdown2')
optdepends=('python-matplotlib'
            'python-pyenchant'
            'python-pip')
options=(!emptydirs)
source=("https://gitlab.com/pyspread/pyspread/-/archive/v${pkgver}/pyspread-v${pkgver}.tar.gz")
sha512sums=('3dbdc29df9dac041ce975231fe902b88f16dad6291eef04b7a8ea8b3a56c96a60577d7273302fd4c80c33e0d48d8851cba97678c4edc4ab2c861e5c09e3b3492')

package() {  
  cd "${srcdir}/${pkgname}-v${pkgver}"
  python setup.py install --root=$pkgdir/ --optimize=1

  install -D "${pkgname}/share/icons/hicolor/svg/$pkgname.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

