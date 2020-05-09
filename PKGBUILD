# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=cattrs
pkgname=python-${_pipname,,}
pkgver=1.0.0
pkgrel=1
pkgdesc='Complex custom class converters for attrs'
arch=('any')
url="https://github.com/Tinche/$_pipname"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_pipname-$pkgver.tar.gz")
sha256sums=('b7ab5cf8ad127c42eefd01410c1c6e28569a45a255ea80ed968511873c433c7a')

build() {
    cd "$_pipname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
