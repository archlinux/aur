# Maintainer: Andre Kugland <kugland@gmail.com>

pkgname="python-subsync"
_pkgname="ffsubsync"
pkgver=0.4.5
pkgrel=1
pkgdesc='Automagically synchronize subtitles with video'
arch=('any')
url="https://github.com/smacke/ffsubsync"
license=('MIT')
provides=('subsync')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('7e7fa844cdde88ffcac553166a3577df81481d8b82c4f3357f184b9744ada0f2')
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
)

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}
