# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=python-pypi-simple
pkgver=0.10.0
pkgrel=1
pkgdesc="PyPI Simple Repository API client library"
provides=('python-pypi-simple')
conflicts=('python-pypi-simple')
arch=(any)
url="https://github.com/jwodder/pypi-simple"
license=(MIT)
depends=("python"
    "python-beautifulsoup4"
    "python-mailbits"
    "python-packaging"
    "python-requests")
makedepends=("python-setuptools" "python-build" "python-installer")
optdepends=("python-tqdm")
source=("https://github.com/jwodder/pypi-simple/archive/refs/tags/v$pkgver.zip")
sha512sums=('665e4be413fa101b359d49c70a45f0d9eab64cea04f7486bb24e5b6a320b534d4cd7984a631215e5b583a61504bcbdbb11ad1ccf4e5c81db16596ed1b314fb80')

build() {
  cd "$srcdir/pypi-simple-$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$srcdir/pypi-simple-$pkgver"
  python -m installer --destdir $pkgdir dist/*.whl
}
