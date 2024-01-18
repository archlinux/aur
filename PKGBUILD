# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-mne
_name=${pkgname#python-}
pkgver=1.6.1
pkgrel=1
pkgdesc="Python package for exploring, visualizing, and analyzing human neurophysiological data: MEG, EEG, sEEG, ECoG, and more"
arch=('any')
url="https://mne.tools/stable/index.html"
license=('BSD')
groups=()
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-pooch' 'python-tqdm' 'python-jinja' 'python-decorator' 'python-psutil' 'python-threadpoolctl' 'python-lazy-loader')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
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
sha1sums=('a87d91acc82514852f5367bdbe534391d6489caf')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
