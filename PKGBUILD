pkgname=python-scrapy
pkgver=1.3.0
pkgrel=1
pkgdesc="A fast high-level scraping and web crawling framework. Python 3 compatible version."
arch=(any)
license=('BSD')
url="http://scrapy.org"
depends=('python-parsel' 'python-pydispatcher' 'python-twisted' 'libxml2'
         'python-w3lib' 'python-lxml' 'python-six' 'python-queuelib'
         'python-setuptools' 'python-cssselect' 'python-pyopenssl'
         'python-service-identity'
        )
conflicts=('scrapy')
makedepends=('git')
optdepends=('ipython: for enhanced support of the interactive scraping shell')
source=("git+https://github.com/scrapy/scrapy.git#tag=${pkgver}")
md5sums=('SKIP')

package() {
  cd "${srcdir}/scrapy"
  python setup.py install -O1 --root="${pkgdir}"
  
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -D -m644 "docs/intro/install.rst" "${pkgdir}/usr/share/doc/${pkgname}/INSTALL.rst"
}

