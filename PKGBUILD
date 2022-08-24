# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-ads
_name=${pkgname#python-}
pkgver=0.12.3
pkgrel=1
pkgdesc="A Python Module to Interact with NASA's ADS that Doesn't Suck™"
arch=(any)
url="https://github.com/andycasey/ads"
license=('custom')
groups=()
makedepends=('python-setuptools')
depends=(python-six python-requests python-httpretty python-werkzeug python-mock)
provides=()
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(ce523f266f6b815bf1d6371b6e7791b4d10989ebe743681b27bd54301f7cdcc9)
build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

