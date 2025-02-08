# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Alexander Scharinger
# Contributor: Tristan Webb <t2webb@ucsd.edu>
# Contributor Sindwiller

pkgname=pyspread
pkgver=2.3.1
pkgrel=1
pkgdesc="Python based non-traditional spreadsheet application"
arch=('any')
url="https://pyspread.gitlab.io/"
license=('GPL3')
depends=('python-setuptools'
        'python-numpy>=1.1.0'
        'python-pyqt6'
        'qt6-svg'
        'python-markdown2')
optdepends=('python-matplotlib'
            'python-pyenchant'
            'python-pip'
            'python-dateutil'
            'python-rpy2'
            'python-plotnine'
            'libvoikko'
            'nuspell'
            'hspell'
            'r-ggplot2'
#             'pyhton-pycel'
            'python-openpyxl')
options=(!emptydirs)
source=("https://gitlab.com/pyspread/pyspread/-/archive/v${pkgver}/pyspread-v${pkgver}.tar.gz")
sha512sums=('747907d8b7b4902765a81f71e5000852f9da5909a8a4baa6558e4400a05ff46ce3a82cd7b87b19f889b67eacf8f74426a0f652852cb9b344d0153bfff5a49d9a')

package() {  
  cd "${srcdir}/${pkgname}-v${pkgver}"
  python setup.py install --root=$pkgdir/ --optimize=1

  install -D "${pkgname}/share/icons/hicolor/svg/$pkgname.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

