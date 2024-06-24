# Maintainer: Donald Webster <fryfrog@gmail.com
# Contributor: Andrew Rabert <arabert at nullsum dot net>

pkgname='python-enzyme'
_name=${pkgname#python-}
pkgver=0.5.1
pkgrel=1
pkgdesc="Python module to parse metadata in video files."
arch=(any)
url="https://github.com/Diaoul/enzyme"
license=('Apache')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
conflicts=(${pkgname}-git)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('8632cce142a805e47d2dccb951d5028cfd2bf07dd82f5bb4b8bb70e118731771226fcf66328f47da6031be61c059adec6456354ae278f00ae294a8a58b6e626a')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
