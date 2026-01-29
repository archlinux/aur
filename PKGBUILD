# Maintainer: Mambuco <gabriele.giambrone@icloud.com>
pkgname=python-axios
pkgver=0.4.0
pkgrel=1
pkgdesc="Command line utility to access the Axios Italia school electronic register"
arch=('any')
url="https://github.com/zmoog/axios"
license=('Apache-2.0')
depends=(
    'python'
    'python-click'
    'python-lxml'
    'python-requests'
    'python-rich'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('05ead76efd427e94ccc672e203a2b19fcbf4aafc4b8fc7060105f492f5be18a2')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
