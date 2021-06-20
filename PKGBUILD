# Maintainer: Andre Kugland <kugland@gmail.com>

pkgname="python-subsync"
_pkgname="ffsubsync"
pkgver=0.4.11
pkgrel=2
pkgdesc='Automagically synchronize subtitles with video'
arch=('any')
url="https://github.com/smacke/ffsubsync"
license=('MIT')
provides=('subsync')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('17624213aeb73cae6edaef1700065e98f5b0632ffbfa5c6b479e38318d998560')
depends=(
    'python>=3.6'
    'python-argparse'
    'python-cchardet'
    'python-ffmpeg'
    'python-future'
    'python-numpy>=1.12.0'
    'python-scikit-learn>=0.20.4'
    'python-six'
    'python-srt>=3.0.0'
    'python-tqdm'
    'python-webrtcvad'
    'python-rich'
    'python-pysubs2'
    'python-auditok'
)
makedepends=(
    'python-coverage'
)

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}
