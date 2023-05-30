# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgver=0.3
pkgrel=1
pkgname=python-yaml2rst
_name=${pkgname#python-}
pkgdesc='A Simple Tool and Python-Module for Documenting YAML Files'
arch=('any')
url='https://github.com/debops/yaml2rst'
license=('GPL3')
makdepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('0c82d1965afabad48230fab8bb100fc5a61e39c274171f410927e239507a1eb2af75c9b907e78dde24df98596debc02f2a282d6dcfddd8f4c4d3f2c0cbd450fa')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
