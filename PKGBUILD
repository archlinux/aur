# Maintainer: darkgeem <darkgeem at pyrokinesis dot fr>

_name=geemlib
pkgname="python-$_name"
pkgver=1.0.3
pkgrel=1
pkgdesc="Geem's all-purpose python library."
arch=('any')
url="https://pypi.org/project/geemlib/"
license=('custom:WTFPL')
depends=(
    'python'
    'python-beautifulsoup4'
    'python-requests'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('93a658707ca72e03990c7b8e0537b272f9a28b3f40ff5b0b952f94d12036d8fac7ab965229b612ecdbec7c9eeb10a6d1b2ae2fea7330aafc1d913bab390a4f43')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
