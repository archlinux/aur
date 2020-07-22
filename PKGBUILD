# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=pylink
pkgver=0.6.1
pkgrel=1
pkgdesc="Python interface for the SEGGER J-Link"
url="https://github.com/Square/pylink"
depends=('python'
         'python-psutil'
         'python-setuptools'
         'python-six'
         )
optdepends=()
license=('Apache')
arch=('any')
source=("https://github.com/square/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('67bd6a7461b3dde3d265cd11ebfaaacb6d74afbcfbc3c87e4c9ceb3f0c3a04165fc05ae4e5000d241676d91294baa3dbc86b9f4bb4a1c27c11725bdf90817051')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1
}

