# Maintainer: Rasmus Steinke <rasi at xssn dot at>

pkgname=python-musicpd
pkgver=0.9.1
pkgrel=1
pkgdesc="An MPD (Music Player Daemon) client library written in pure Python."
arch=('any')
url="https://pypi.python.org/pypi/python-musicpd"
license=('GPL')
depends=('python')
makedepends=('make' 'python-build' 'python-installer' 'python-wheel')
source=("https://gitlab.com/kaliko/python-musicpd/-/archive/v${pkgver}/python-musicpd-v${pkgver}.tar.gz")
md5sums=('64279cbfde24928786f58dc443759910')

build() {
    cd $pkgname-v${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-v${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
