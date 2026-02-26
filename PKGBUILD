# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-autoreject
_name=${pkgname#python-}
pkgver=0.4.3
pkgrel=1
pkgdesc="Python package for automatically rejecting bad trials and sensors in EEG/MEG data"
arch=('any')
url="https://autoreject.github.io/stable/index.html"
license=('BSD')
groups=()
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-scikit-learn' 'python-joblib' 'python-mne' 'python-h5io' 'python-pymatreader')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
optdepends=('python-scikit-learn' 'python-pandas')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz)
noextract=()
sha1sums=('de44eaaf8ebd6264001dbc1d120da877d099284d')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
