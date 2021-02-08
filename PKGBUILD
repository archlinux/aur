# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=cattrs
pkgname=python-${_pipname,,}
pkgver=1.2.0
pkgrel=1
pkgdesc='Complex custom class converters for attrs'
arch=('any')
url="https://github.com/Tinche/$_pipname"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_pipname-$pkgver.tar.gz")
sha256sums=('daa70f0755d2e052b4854862f1c3afe2cc02d4de5f16fb72c249ac1608d2fd83')

build() {
    cd "$_pipname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
