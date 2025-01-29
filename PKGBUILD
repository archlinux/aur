# Maintainer: darkgeem <darkgeem at pyrokinesis dot fr>

_name=geemlib
pkgname="python-$_name"
pkgver=1.1.1
pkgrel=1
pkgdesc="Geem's all-purpose python library."
arch=('any')
url="https://pypi.org/project/geemlib/"
license=('custom:WTFPL')
depends=(
    'python'
    'python-beautifulsoup4'
    'python-requests'
	'python-rich'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('5e24ea1626b546e222abbaefe82a469093e127d9bb95f7c16380cd96466692aebe4918c7be5d3a9b1373454d5a61a4e3347905becfd5983d2b4536d693c301d7')

build() {
    cd "$srcdir/$_name-$pkgver"
	export PYTHONDONTWRITEBYTECODE=
	export PYTHONPYCACHEPREFIX=
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
	export PYTHONDONTWRITEBYTECODE=
	export PYTHONPYCACHEPREFIX=
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
