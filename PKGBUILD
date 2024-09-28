# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Alexander Scharinger
# Contributor: Tristan Webb <t2webb@ucsd.edu>
# Contributor Sindwiller

pkgname=pyspread
pkgver=2.3
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
sha512sums=('a171f3272c2bdbc1508fbdbdeefea7c1194a1cd05a227f6e1883bd9acb30d1c15b9edc44fe9dcd95f7fdcbfd4886e4de6147bac6837c97af13d85a5b4bdea59d')

package() {  
  cd "${srcdir}/${pkgname}-v${pkgver}"
  python setup.py install --root=$pkgdir/ --optimize=1

  install -D "${pkgname}/share/icons/hicolor/svg/$pkgname.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

