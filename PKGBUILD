# Maintainer: erdii <me at erdii dot engineering>
pkgname=ramalama
pkgver=0.8.1
pkgrel=0
pkgdesc="The goal of RamaLama is to make working with AI boring."
arch=('any')
url="https://github.com/containers/ramalama"
license=('MIT')
depends=('python-argcomplete')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('4e1a91989c95252b1c009c6e58e7d18165b87c190f1b375870e6f4a56e70e14c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
