# Maintainer: Vasil Bakalov <jens300304@gmail.com>
pkgname=python-ossapi
url="https://github.com/circleguard/ossapi"
pkgver=2.0.0
pkgrel=1
pkgdesc="A python wrapper for the osu! api."
arch=('any')
license=('GPL3')
source=(
    "https://github.com/circleguard/ossapi/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    '363e48e5d778df49f7964b100bfbe641bb9db79b47062c171a37c08a3e2e6faf'
)
depends=(
    'python'
    'python-requests'
    'python-requests-oauthlib'
)
makedepends=('python-setuptools')
conflicts=('python-ossapi-git')

build() {
    cd "$srcdir/ossapi-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/ossapi-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
