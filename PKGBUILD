# Maintainer: Ronan Pigott <rpigott@berkeley.edu>

pkgname='python-pypresence'
pkgver=4.2.0
pkgrel=1
pkgdesc='A complete Discord RPC and Rich Presence wrapper library in Python'
url='https://qwertyquerty.github.io/pypresence/html/index.html'
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/p/pypresence/pypresence-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/qwertyquerty/pypresence/master/LICENSE")
md5sums=('87fb41e2a5a353a4ec8e74169da87a69'
         '43c3642351bf4af10745d33f4b301aad')
build() {
  cd "${srcdir}/pypresence-${pkgver}"
  python setup.py build
}

package() {
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}/pypresence-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
