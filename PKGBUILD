# Maintainer: Ista Zahn <istazahn[at]gmail[dot]com>

pkgbase=python-requests-html
_pyname=requests-html
pkgname=('python-requests-html')
depends=('python' 'python-requests' 'python-pyquery' 'python-fake-useragent' 
'python-parse' 'python-beautifulsoup4' 'python-w3lib' 'python-pyppeteer')
makedepends=('python-setuptools')
pkgver=0.9.0
pkgrel=1
pkgdesc="HTML Parsing for Humans"
arch=('any')
url="http://html.python-requests.org/"
license=('MIT')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/kennethreitz/${_pyname}/archive/v${pkgver}.tar.gz")
sha512sums=('2a964eaf9ceb622700b4f8063332dd6de8e898db0a8a9eb682e2d8ae9ac75a4ac04312d4c538b5b0e69e1d3d391a71733ecb77703cd85e5da3973359cfe07db2')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set et sw=2 ts=2 tw=79:
