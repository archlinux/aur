# Maintainer: Andre Kugland <kugland@gmail.com>

pkgname="python-subsync"
_pkgname="subsync"
pkgver=0.2.17
pkgrel=1
pkgdesc='Automagically synchronize subtitles with video'
arch=('any')
url="https://github.com/smacke/subsync"
license=('MIT')
provides=('subsync')
source=("https://github.com/smacke/subsync/archive/v${pkgver}.tar.gz")
sha256sums=('6e28c51b3822ddff945efb060c36d659203d29518837893c57024bdfbd6c527b')
depends=(
    'python-argparse'
    'python-ffmpeg'
    'python-future'
    'python-numpy>=1.12.0'
    'python-scikit-learn>=0.20.4'
    'python-six'
    'python-srt>=3.0.0'
    'python-tqdm'
    'python-webrtcvad'
)

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}
