# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-wolframclient
_name=${pkgname#python-}
pkgver=1.4.0
pkgrel=1
pkgdesc="A Python library with various tools to interact with the Wolfram Language and the Wolfram Cloud"
arch=(any)
url="https://www.wolfram.com/"
license=(MIT)
groups=()
depends=(python-numpy python-pytz python-requests python-aiohttp python-oauthlib python-pyzmq python-certifi)
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('59f1f0a71257fa79c444cc9489097fe74e2c7890157f252a961cea406e17e9fb')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}