# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: Joel Almeoda <aullidolunar at gmail d0t c0m>

pkgname=qualcoder
pkgver=2.5
pkgrel=1
pkgdesc="Qualitative data analysis software written in python3 and pyqt5"
arch=('any')
url='https://github.com/ccbogel/QualCoder'
license=('MIT')
depends=('python-pyqt5'
         'python-lxml'
         'python-pillow'
         'python-pdfminer'
         'python-ply'
         'python-chardet'
         'python-openpyxl'
         'python-ebooklib')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.deb::https://github.com/ccbogel/QualCoder/releases/download/${pkgver}/qualcoder-${pkgver}.deb")
sha256sums=('db2f389d6fce1a56008974ce5d81eac75a3545fac94ef9fb37a67b7da3ecb87e')

package() {
	tar xvf data.tar.xz -C "${pkgdir}"
	install -Dm644 "${pkgdir}/usr/share/doc/qualcoder/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	rm "${pkgdir}/usr/share/doc/qualcoder/copyright"
	chmod 755 "${pkgdir}/usr/bin/qualcoder"
}
