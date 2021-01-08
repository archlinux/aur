# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-mnelab
_name=${pkgname#python-}
pkgver=0.6.3
pkgrel=1
pkgdesc="Graphical user interface (GUI) for MNE, a Python-based toolbox for EEG/MEG analysis"
arch=('any')
url="https://github.com/cbrnr/mnelab"
license=('BSD')
groups=()
depends=('python' 'python-qtpy' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-mne')
makedepends=()
optdepends=('python-scikit-learn')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz
        mnelab.desktop)
noextract=()
sha1sums=('6d3bcbf9f3be8f1c3e77e5be0608b0973f335e23'
          '19c8abd304416595d8316f91eb2b5410aa88b070')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    mkdir -p "$pkgdir/usr/share/applications"
    cp mnelab.desktop "$pkgdir/usr/share/applications"
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
