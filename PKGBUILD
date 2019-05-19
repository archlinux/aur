# Maintainer: Ronan Pigott <rpigott@berkeley.edu>

pkgname='python-pypresence'
pkgver=3.1.0
pkgrel=1
pkgdesc='A complete Discord RPC and Rich Presence wrapper library in Python'
url='https://qwertyquerty.github.io/pypresence/html/index.html'
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://github.com/qwertyquerty/pypresence/releases/download/3.1.0/pypresence-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/qwertyquerty/pypresence/master/LICENSE")
sha256sums=('7a3ac3bb6a7b4107a0cd0846a4a7ea5fc1c95bf45bb04072e3608a207e90c421'
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

# vim:set ts=2 sw=2 et:
