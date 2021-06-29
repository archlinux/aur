# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Ronan Pigott <rpigott@berkeley.edu>

pkgname=python-pypresence
pkgver=4.2.0
pkgrel=2
pkgdesc='A complete Discord RPC and Rich Presence wrapper library in Python'
url='https://qwertyquerty.github.io/pypresence/html/index.html'
arch=('any')
license=('MIT')
depends=('python>=3.5')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pypresence/pypresence-$pkgver.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/qwertyquerty/pypresence/$pkgver/LICENSE")
sha256sums=('54618a18085d104aa063df8296dac95cf01b922ed8aab4b021f71718bb3f19b1'
            'a3286e2d54c65b24c18fb69c714fd19318f3ce9b36a816f198d2cae28c77dfc3')

build() {
  cd "${srcdir}/pypresence-${pkgver}"
  python setup.py build
}

package() {
  install -Dm644 "LICENSE-$pkgver" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}/pypresence-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
