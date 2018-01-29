# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=python2-abjad
pkgver=2.21
pkgrel=1
pkgdesc="Tool for formalized music score control."
arch=("any")
url="https://github.com/Abjad/abjad"
license=("GPL 3")
depends=(
    "lilypond"
    "python2"
    "python2-mock"
    "python2-funcsigs"
    "python2-enum34"
    "python2-pathlib2"
    "python2-scandir"
    "python2-ply"
    "python2-six"
    )
makedepends=("python2-setuptools")
conflicts=("python-abjad")
provides=("python-abjad")
optdepends=(
    "graphviz: to create rhythm-trees graphs and other tree structures"
    "fluidsynth: to play generated MIDI files (instead of timidity++)"
    "timidity++: to play generated MIDI files (instead of fluidsynth)"
    "jupyter: browser-based interactive notebook for programming"
    "ipython2: an enhanced Python 2 console"
    "python2-ipykernel: Python 2 support for Jupyter"
    "python2-ipywidgets: IPython2 widgets for Jupyter notebook"
    "python2-pypdf2: PDF toolkit"
    )
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("5fc1fc977b9521d4b9ce1aa8bdea1aa07306e313bd03feea15e8c680b4f27c5b")

build() {
    cd $srcdir/abjad-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/abjad-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

