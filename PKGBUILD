# Maintainer: robertfoster
# Contributor: Ista Zahn <istazahn[at]gmail[dot]com>

pkgbase=python-requests-html
_pyname=requests-html
pkgname=('python-requests-html')
depends=('python' 'python-requests' 'python-pyquery' 'python-fake-useragent'
  'python-parse' 'python-beautifulsoup4' 'python-w3lib' 'python-pyppeteer')
makedepends=('python-setuptools')
pkgver=0.10.0 # renovate: datasource=github-tags depName=kennethreitz/requests-html
pkgrel=1
pkgdesc="HTML Parsing for Humans"
arch=('any')
url="http://html.python-requests.org/"
license=('MIT')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/kennethreitz/${_pyname}/archive/v${pkgver}.tar.gz")

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  sed -i "s|bs4|beautifulsoup4|g" setup.py
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

sha256sums=('7000a0e26cf00fc96abfc4752cb20c4d9c3ca787128e05fbdadd96c11a277c99')
