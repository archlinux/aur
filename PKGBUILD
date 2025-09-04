# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Alexander Scharinger
# Contributor: Tristan Webb <t2webb@ucsd.edu>
# Contributor Sindwiller
# Contributor SecByShresth <shresthpaul133@gmail.com>

pkgname=pyspread
pkgver=2.4
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
source=("https://files.pythonhosted.org/packages/7f/4b/35ea2e66ad830a44b95ee610518c0f96ac049f04b67dcec420fc30c9c062/pyspread-2.4.tar.gz")
sha256sums=('319951d916a9e683117c29acc20f56fff158164484922edec8c3612e81998093')

package() {  
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root=$pkgdir/ --optimize=1

  install -D "${pkgname}/share/icons/hicolor/svg/$pkgname.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

