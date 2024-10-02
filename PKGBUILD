# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
# Maintainer: Paul Irofti <paul@irofti.net>
pkgname=python-scholarly
_name=${pkgname#python-}
pkgver=1.7.11
pkgrel=1
pkgdesc="Retrieve author and publication information from Google Scholar in a friendly, Pythonic way"
arch=(any)
url="https://github.com/OrganicIrradiation/scholarly"
license=('Unlicense')
groups=()
depends=(python-arrow python-beautifulsoup4 python-bibtexparser python-requests python-dotenv python-free_proxy python-fake-useragent python-selenium python-stem)
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2c983dd44d9d9398a6f2605102ae6e5586023b41ebbaec1461917ee48eb153f0')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

