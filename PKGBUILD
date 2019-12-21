# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=python-abjad
pkgver=3.1
pkgrel=1
groups=('abjad')
pkgdesc='Tool for formalized music score control.'
arch=('any')
url="https://github.com/Abjad/abjad"
license=('GPL3')
depends=('lilypond'
        'python'
        'python-ply'
        'python-six'
        'python-uqbar'
        'python-roman'
        )
makedepends=('python-setuptools')
optdepends=(
        'fluidsynth: to play generated MIDI files (instead of timidity++)'
        'timidity++: to play generated MIDI files (instead of fluidsynth)'
        'graphviz: to create rhythm-trees graphs and other tree structures'
        )
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('df5d13a1c78dc89be399fc67a0e40f115377e9ba8fb564b5da614d8c0dc8e362')


build() {
    cd $srcdir/abjad-$pkgver
    python setup.py build
}


package() {
    cd $srcdir/abjad-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

