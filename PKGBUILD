# Maintainer: Andre Kugland <kugland@gmail.com>

pkgname="python-subsync"
_pkgname="ffsubsync"
pkgver=0.4.8
pkgrel=2
pkgdesc='Automagically synchronize subtitles with video'
arch=('any')
url="https://github.com/smacke/ffsubsync"
license=('MIT')
provides=('subsync')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('f72e918e5d679f8c7cd7376778dc4b65489963b33a632fecb0b071f455437d6e')
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

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}
