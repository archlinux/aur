# Maintainer: kiasoc5 <kiasoc5 at tutanota dot com>
# Contributor: xantares

pkgname=stargate
pkgver=21.11.2
pkgrel=1
pkgdesc="A digital audio workstation (DAW) with a powerful pattern-based workflow"
license=('GPL')
arch=('x86_64')
url="https://stargateaudio.github.io/"
depends=(
    'fftw'
    'libsndfile'
    'portaudio'
    'portmidi'
    'python-jinja'
    'python-mido'
    'python-mutagen'
    'python-numpy'
    'python-psutil'
    'python-yaml'
    'python-pyqt5'
    'rubberband'
)
makedepends=(
    'cython'
    'jq'
    'python-pip'
)
optdepends=(
    'lame'
    'ffmpeg'
    'vorbis-tools'
)
source=("https://github.com/stargateaudio/stargate/archive/refs/tags/release-${pkgver}.tar.gz")
sha256sums=('ce196e5a6095707d33df8c4c5bba9cdf8713c061195350730d3ab70270ccc45f')

build() {
  cd stargate-release-${pkgver}/src
  make
}

package() {
  cd stargate-release-${pkgver}/src
  PREFIX=${pkgdir}/usr make install
}
