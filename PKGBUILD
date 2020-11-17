# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=qualcoder
pkgver=2.1
pkgrel=1
pkgdesc="Qualitative data analysis software written in python3 and pyqt5"
arch=('any')
url='https://github.com/ccbogel/QualCoder'
license=('MIT')
depends=('python-pyqt5'
         'python-lxml'
         'python-pillow'
         'python-pdfminer.six'
         'python-ply'
         'python-chardet'
         'python-openpyxl'
         'python-ebooklib')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.deb::https://github.com/ccbogel/QualCoder/releases/download/${pkgver}/qualcoder-${pkgver}.deb")
sha256sums=('4a47ae07558b0180126c84d29d2a35044cb5a3aaef7ec7f4612323793f30f466')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/share/doc/qualcoder/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm "${pkgdir}/usr/share/doc/qualcoder/copyright"
  chmod 755 "${pkgdir}/usr/bin/qualcoder"
}
