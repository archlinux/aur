# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Alexander Scharinger
# Contributor: Tristan Webb <t2webb@ucsd.edu>
# Contributor Sindwiller

pkgname=pyspread
pkgver=2.2.2
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
sha512sums=('12058a1593dbc3c61d85bd24d73370c093c89f2162959875484fd0be821da7ccb9206a7a7a1a45fb3d20a6c38fcb64615d5c0394055ae3596781d7961a3bec40')

package() {  
  cd "${srcdir}/${pkgname}-v${pkgver}"
  python setup.py install --root=$pkgdir/ --optimize=1

  install -D "${pkgname}/share/icons/hicolor/svg/$pkgname.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

