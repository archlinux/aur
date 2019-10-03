# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-orderedattrdict
pkgver=1.5.1
pkgrel=2
pkgdesc="An ordered Python dictionary with attribute-style access"
url="https://github.com/sanand0/orderedattrdict"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-yaml')
license=('MIT')
source=(
  "https://github.com/sanand0/orderedattrdict/archive/v$pkgver.tar.gz"
)
sha256sums=(
  'd09b2963361b6e13fb067db257559616699c137cab0cc284579d58c044d13106'
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
