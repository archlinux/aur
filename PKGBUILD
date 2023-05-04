# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-minimal-snowplow-tracker
pkgver=0.0.2
pkgrel=2
pkgdesc="A minimal snowplow event tracker for Python"
arch=('any')
url="https://pypi.org/project/minimal-snowplow-tracker/"
license=('Apache')
makedepends=("python" "python-pytest")
depends=("python-requests" "python-six")
conflicts=(python-snowplow-tracker)
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('acabf7572db0e7f5cbf6983d495eef54081f71be392330eb3aadb9ccb39daaa4')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
