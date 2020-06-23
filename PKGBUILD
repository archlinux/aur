# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-orderedattrdict
pkgver=1.6.0
pkgrel=1
pkgdesc="An ordered Python dictionary with attribute-style access"
url="https://github.com/sanand0/orderedattrdict"
arch=('any')
depends=('python')
optdepends=('python-yaml: for working with YAML files')
makedepends=('python-setuptools')
checkdepends=('python-yaml')
license=('MIT')
source=(
  "orderedattrdict-$pkgver.tar.gz::https://github.com/sanand0/orderedattrdict/archive/v$pkgver.tar.gz"
)
sha256sums=(
  '6aa52111168b3cd5884d2118e911741aff1eb6240fcca6308a89c7d378bc7413'
)

build() {
    cd "orderedattrdict-$pkgver"
    python setup.py build
}

check() {
    cd "orderedattrdict-$pkgver"
    python setup.py test
}

package() {
    cd "orderedattrdict-$pkgver"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -t "${pkgdir}/usr/share/doc/${pkgname}" -vDm 644 README.rst
}
