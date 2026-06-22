# Maintainer: Andy Chow <thegreatandychow@gmail.com>
pkgname=python-luigi
_name=luigi
pkgver=3.8.1
pkgrel=1
pkgdesc="Workflow management, task scheduling, and dependency resolution"
arch=('any')
url="https://github.com/spotify/luigi"
license=('Apache-2.0')

depends=(
    'python'
    'python-dateutil'
    'python-tornado'
    'python-daemon'
    'python-tenacity'
    'python-typing_extensions'
    'python-psutil'
    'python-prometheus_client'
    'python-mechanize'
    'python-requests'
    'python-pygments'
    'python-jsonschema'
)

makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
    'python-hatchling'
    'python-hatch-fancy-pypi-readme'
)

source=("$_name-$pkgver.tar.gz::https://github.com/spotify/luigi/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6d3bef9b59a3320565bb2eb9c44f9f9d049cdaab567fc297a6a901ff4851f3d8')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
