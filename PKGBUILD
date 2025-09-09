# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-ads
_name=${pkgname#python-}
pkgver=0.12.7
pkgrel=1
pkgdesc="A Python Module to Interact with NASA's ADS that Doesn't Suck™"
arch=(any)
url="https://github.com/andycasey/ads"
license=('custom')
groups=()
makedepends=('python-build' 'python-installer')
depends=(python-six python-requests python-httpretty python-werkzeug python-mock)
provides=()
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(c02687302576c33944a91654a39156ef6d7f6093b26b9ecd49e7540bee1fde94)
build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

