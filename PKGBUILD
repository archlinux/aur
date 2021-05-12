# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=plum
pkgname=python-${_pipname,,}
pkgver=0.5.0
pkgrel=1
pkgdesc='Pack/Unpack Memory'
arch=('any')
url="https://$_pipname-py.readthedocs.io/en/latest/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://gitlab.com/dangass/$_pipname/-/archive/$pkgver/$_pipname-$pkgver.tar.bz2")
sha256sums=('81abe267a49fe95f20368725c27a43122e4db981e9ae3b3e94139e924940a54a')

build() {
    cd "$_pipname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
