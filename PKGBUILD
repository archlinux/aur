# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgver=0.3
pkgrel=2
pkgname=python-yaml2rst
_name=${pkgname#python-}
pkgdesc='A Simple Tool and Python-Module for Documenting YAML Files'
arch=('any')
url='https://github.com/debops/yaml2rst'
license=('GPL3')
makdepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('a2886ff5cafc4996b5faf94907e88d6882f7a220d60cb8a766ca9af13012adb043b101b43b9e9303cb269e73d957b8e6f05bff5c6e16df270571373a2c4d0298')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
