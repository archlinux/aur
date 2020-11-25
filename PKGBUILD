# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=cattrs
pkgname=python-${_pipname,,}
pkgver=1.1.1
pkgrel=1
pkgdesc='Complex custom class converters for attrs'
arch=('any')
url="https://github.com/Tinche/$_pipname"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_pipname-$pkgver.tar.gz")
sha256sums=('cd7579ef6ed80993bdd0e24a806493c48576caebd47b7b6ec2cd3cfd0b9a5f72')

build() {
    cd "$_pipname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
