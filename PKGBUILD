# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
# Maintainer: Paul Irofti <paul@irofti.net>
pkgname=python-scholarly
_name=${pkgname#python-}
pkgver=1.5.1
pkgrel=3
pkgdesc="Retrieve author and publication information from Google Scholar in a friendly, Pythonic way"
arch=(any)
url="https://github.com/OrganicIrradiation/scholarly"
license=('Unlicense')
groups=()
depends=('python-arrow' 'python-beautifulsoup4' 'python-bibtexparser'
	'python-requests' 'python-dotenv' 'python-free_proxy'
	'python-fake-useragent' 'python-selenium' 'python-stem')
makedepends=('python-setuptools' 'python-numpy')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(c322e23321fcc0491da62b9ccbfccc2b76780b94487fc8e61a1a429a058e2cde)

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

