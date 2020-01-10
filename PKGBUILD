# Maintainer: Ronan Pigott <rpigott@berkeley.edu>

pkgname='python-pypresence'
pkgver=3.3.2
pkgrel=1
pkgdesc='A complete Discord RPC and Rich Presence wrapper library in Python'
url='https://qwertyquerty.github.io/pypresence/html/index.html'
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/p/pypresence/pypresence-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/qwertyquerty/pypresence/master/LICENSE")
sha256sums=('d39f8eb79c521ae2f3dd8e2dbfa204d7df4201f044b68bcae6339c75b87dfb7b'
            'a3286e2d54c65b24c18fb69c714fd19318f3ce9b36a816f198d2cae28c77dfc3')

build() {
  cd "${srcdir}/pypresence-${pkgver}"
  python setup.py build
}

package() {
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}/pypresence-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
