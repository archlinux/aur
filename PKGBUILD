# Maintainer: robertfoster
# Contributor: Ista Zahn <istazahn[at]gmail[dot]com>

pkgbase=python-pyppeteer
_pyname=pyppeteer
pkgname=('python-pyppeteer')
pkgver=0.2.3
pkgrel=1
pkgdesc="Headless chrome/chromium automation library"
arch=('any')
url="https://github.com/${_pyname}/${_pyname}"
license=('MIT')
depends=('python' 'python-pyee' 'python-tqdm' 'python-websockets')
makedepends=('python-poetry')
source=("${_pyname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  poetry build --format wheel
}

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
}

md5sums=('7741586b0efeefd03bf77e7cf30b06f4')
