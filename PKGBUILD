

# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Alexander Scharinger
# Contributor: Tristan Webb <t2webb@ucsd.edu>
# Contributor Sindwiller
# Contributor SecByShresth <shresthpaul133@gmail.com>

pkgname=pyspread
pkgver=2.4.1
pkgrel=1
pkgdesc="Python based non-traditional spreadsheet application"
arch=('any')
url="https://pyspread.gitlab.io/"
license=('GPL3')
depends=('python-setuptools'
        'python-numpy'
        'python-pyqt6'
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
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pyspread/pyspread-$pkgver.tar.gz")
sha256sums=('6686fe39741b6b28449d298a52ebe791a12e061eda3b627c0eb1f2cde3f9e83c')

package() {  
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root=$pkgdir/ --optimize=1

  install -D "${pkgname}/share/icons/hicolor/svg/$pkgname.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

