# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=plum
pkgname=python-${_pipname,,}
pkgver=0.6.0
pkgrel=1
pkgdesc='Pack/Unpack Memory'
arch=('any')
url="https://$_pipname-py.readthedocs.io/en/latest/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://gitlab.com/dangass/$_pipname/-/archive/$pkgver/$_pipname-$pkgver.tar.bz2")
sha256sums=('1a21067b45929e6ff738c294d108ade94877920e88180bc6814cc0807fb8655e')

build() {
    cd "$_pipname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
