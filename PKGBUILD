# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-texsoup
_name=TexSoup
pkgver=0.3.1
pkgrel=4
pkgdesc="Python3 package for searching, navigating, and modifying LaTeX documents using BeautifulSoup-esque idioms"
arch=(any)
url="https://github.com/alvinwan/TexSoup"
license=('BSD')
groups=()
depends=()
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(3f6b2ad0abe3688a6656f544c1ba04d0eb25f423f8c377b7369f9ce061ddb70b)
build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

