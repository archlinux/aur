# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-mnelab
_name=${pkgname#python-}
pkgver=0.5.3
pkgrel=1
pkgdesc="Graphical user interface (GUI) for MNE, a Python-based toolbox for EEG/MEG analysis"
arch=('any')
url="https://github.com/cbrnr/mnelab"
license=('BSD')
groups=()
depends=('python' 'python-pyqt5' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-mne' 'python-pebble')
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
sha1sums=('054eb53c17dc0364f370fe6067917a2122cd9803'
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
