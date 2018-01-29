# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=python-abjad
pkgver=2.21
pkgrel=1
pkgdesc="Tool for formalized music score control."
arch=("any")
url="https://github.com/Abjad/abjad"
license=("GPL 3")
depends=(
    "lilypond"
    "python"
    "python-ply"
    "python-six"
    )
makedepends=("python-setuptools")
conflicts=('python2-abjad')
optdepends=(
    "graphviz: to create rhythm-trees graphs and other tree structures"
    "fluidsynth: to play generated MIDI files (instead of timidity++)"
    "timidity++: to play generated MIDI files (instead of fluidsynth)"
    "jupyter: browser-based interactive notebook for programming"
    "ipython: an enhanced Python console"
    "python-ipywidgets: IPython widgets for Jupyter notebook"
    "python-pypdf2: PDF toolkit"
    )
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("5fc1fc977b9521d4b9ce1aa8bdea1aa07306e313bd03feea15e8c680b4f27c5b")

build() {
    cd $srcdir/abjad-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/abjad-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

