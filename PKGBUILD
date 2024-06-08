# Contributor: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)

pkgname=python-pywwt
_name=${pkgname#python-}
pkgver=0.24.1
pkgrel=1
pkgdesc="Python interface to the Windows and Web client of WorldWide Telescope"
arch=(any)
url="https://github.com/WorldWideTelescope/pywwt"
license=('BSD-3-Clause')
depends=('python-numpy' 'python-matplotlib' 'python-requests' 'python-beautifulsoup4' 'python-lxml' 'python-ipywidgets' 'python-traitlets' 'python-qtpy' 'python-flask' 'python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('658efbc6d1af15630473a1d0b6b1ffa28c25afe7399ac5b0d2aff564817f43fa')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
