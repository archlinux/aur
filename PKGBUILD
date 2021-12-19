# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Alexander Scharinger
# Contributor: Tristan Webb <t2webb@ucsd.edu>
# Contributor Sindwiller

pkgname=pyspread
pkgver=2.0.2
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
sha512sums=('2e3ce8796b1ea3e123440e36873c57ba4e143107cfd7d4d88419928d3ae78c14a5882c921bc150667cccdb4ee8fc47fcbccbad536e7daa324b3027682fb344e2')

package() {  
  cd "${srcdir}/${pkgname}-v${pkgver}"
  python setup.py install --root=$pkgdir/ --optimize=1

  install -D "${pkgname}/share/icons/$pkgname.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

