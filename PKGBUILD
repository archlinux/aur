# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=cattrs
pkgname=python-${_pipname,,}
pkgver=1.4.0
pkgrel=1
pkgdesc='Complex custom class converters for attrs'
arch=('any')
url="https://github.com/Tinche/$_pipname"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_pipname-$pkgver.tar.gz")
sha256sums=('3e95495dc7504108427f1b69d63360ef9d04b6e7d3305b351835549a8c05f4bc')

build() {
    cd "$_pipname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
