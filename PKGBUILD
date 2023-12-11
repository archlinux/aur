# Maintainer: Luca Weiss <luca@z3ntu.xyz>
pkgname=lsip6
pkgver=0.2.0
pkgrel=1
pkgdesc="Find link-local IPv6 neighbors on point-to-point links"
arch=('any')
url="https://git.sr.ht/~martijnbraam/lsip6"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://git.sr.ht/~martijnbraam/lsip6/archive/$pkgver.tar.gz")
sha512sums=('e5af476807ff1315df9830a0de3875bde6025a7d508aa11c54d4c05f9649159bb3dec51419103427ca7cb63932e92e614ff41b7bc24f0fa2b913671cbfa3816b')

build() {
    cd "lsip6-$pkgver"
    python setup.py build
}

package() {
    cd "lsip6-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
