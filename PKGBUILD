# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-orderedattrdict
pkgver=1.5.1
pkgrel=1
pkgdesc="An ordered Python dictionary with attribute-style access"
url="https://github.com/sanand0/orderedattrdict"
arch=('any')
depends=('python')
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

package() {
    cd "orderedattrdict-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
