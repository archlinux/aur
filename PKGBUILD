# Maintainer: Jeffrey Zhang <zhang.lei.fly#gmail.com>

pkgname=python-i3
_pkgname=i3-py
pkgver=0.6.4
pkgrel=1
pkgdesc="Python based tools for i3 users and developers"
arch=("any")
url="https://github.com/ziberna/i3-py"
license=('BSD')
source=(
    "https://files.pythonhosted.org/packages/d5/ee/0a871229bbd6268ae4b3d426dce41ad09d03383463879439145c35615706/i3-py-${pkgver}.tar.gz"
)

sha256sums=(
    '1e3179c6a5f4761aad3ff0859780ffc31fa779f5832d78a86f8cac2cd120f4e9'
)

build() {
    cd ${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${_pkgname}-${pkgver}
    # python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    python setup.py install --root="$pkgdir"
}
