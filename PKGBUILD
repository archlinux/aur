# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
_name=crlbuilder
pkgname=python-crlbuilder
pkgver=0.10.2
pkgrel=1
pkgdesc="Python library for generating OCSP requests and responses"
url="https://github.com/wbond/crlbuilder"
arch=(any)
license=(custom:MIT)
depends=(python python-asn1crypto python-oscrypto)
makedepends=(python-setuptools)
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/wbond/${_name}/${pkgver}/LICENSE")
sha256sums=("0bf746415c047885752b5d2f996db84284f85b8559342d5595c9737bfc08c168"
            '3ef40aca4f8f13ab0431c203148085a228c85ec64f30d6a06438f304552e958f')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install -O1 --skip-build --root="$pkgdir"
  install -Dm644 ../$pkgname-$pkgver-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
