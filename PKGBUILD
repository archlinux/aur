# Maintainer: Jeffrey Zhang <zhang.lei.fly#gmail.com>

pkgname=i3-cycle
_pkname=i3-py
pkgver=1.0
pkgrel=1
pkgdesc="Cycle focus through i3 containers"
arch=("any")
url="https://github.com/dustbyte/i3-cycle"
license=('ISC')
depends=('python-i3-tree')
source=(
    "https://files.pythonhosted.org/packages/5f/1c/daaf06aee941e7830bae46a8e88a3ca9a1260c88bb55ebbea044ae3261de/${pkgname}-${pkgver}.tar.gz"
    "https://raw.githubusercontent.com/dustbyte/i3-cycle/master/LICENSE.md"
)

sha256sums=(
    'c63dd00ac5c40f3e2dc57d0dbd5c8a908dd0831e35e6e704fdf098f39b7f6a0c'
    '736c469ba9329510b4c8a3f3ce7213d9c335d19fe938702666fea073ef6c8e3e'
)

build() {
    cd ${pkgname}-${pkgver}
    python setup.py build
}

package() {
    install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    cd ${pkgname}-${pkgver}
    # python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    python setup.py install --root="$pkgdir"
}
