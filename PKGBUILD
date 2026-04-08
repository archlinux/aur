# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-texsoup
_name=texsoup
pkgver=0.3.3
pkgrel=1
pkgdesc="Python3 package for searching, navigating, and modifying LaTeX documents using BeautifulSoup-esque idioms"
arch=(any)
url="https://github.com/alvinwan/TexSoup"
license=('BSD')
groups=()
depends=()
makedepends=(python-build python-installer python-setuptools python-wheel)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a3e22b61ce890a602eed006c80119f64b1697e48e39f13c0b094c2efc1dc1abf')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
