# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pretty_midi
_name=pretty_midi
pkgver=0.2.10
pkgrel=2
epoch=
pkgdesc="Python functions and classes for handling MIDI data conveniently."
arch=('any')
url="https://pypi.org/project/pretty_midi"
license=(MIT)
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
depends=(
    python
    python-numpy
    python-six
    #AUR
    python-mido

)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('ea6e192f94044674e833336ea1f415318ddf28e320302ac7b109edff0d4534bd')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

