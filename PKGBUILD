pkgname=python-parsel
pkgver=1.1.0
pkgrel=1
pkgdesc="Parsel lets you extract data from XML/HTML documents using XPath or CSS selectors."
arch=(any)
license=('BSD')
url="http://scrapy.org"
makedepends=('git')
source=("git+https://github.com/scrapy/parsel.git#tag=v${pkgver}")
md5sums=('SKIP')

package() {
  cd "${srcdir}/parsel"
  python setup.py install -O1 --root="${pkgdir}"
  
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -D -m644 "docs/installation.rst" "${pkgdir}/usr/share/doc/${pkgname}/INSTALL.rst"
}

