# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
# Maintainer: Paul Irofti <paul@irofti.net>
pkgname=python-scholarly
_name=${pkgname#python-}
pkgver=1.7.2
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
sha256sums=(558ed93cc64d0e87585e4a23046ee071297e60b2a57da4f06cddb5129493d49a)

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

