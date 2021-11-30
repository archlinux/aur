# Maintainer: kiasoc5 <kiasoc5 at tutanota dot com>
# Contributor: xantares

pkgname=stargate
pkgver=21.11.7
pkgrel=1
pkgdesc="A digital audio workstation (DAW) with a powerful pattern-based workflow"
license=('GPL')
arch=('x86_64' 'aarch64')
url="https://stargateaudio.github.io/"
depends=(
    'alsa-lib'
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
    'python-pymarshal'
    'python-wavefile'
    'python-pyqt5'
    'rubberband'
    'sbsms'
)
makedepends=(
    'cython'
    'jq'
    'libsbsms'
)
optdepends=(
    'lame'
    'ffmpeg'
    'vorbis-tools'
    'python-pyqt6: qt6 support'
    'qt6-svg: qt6 support'
)
source=("https://github.com/stargateaudio/stargate/archive/refs/tags/release-${pkgver}.tar.gz")
sha256sums=('15ec0bfe3f21850e1e7230daa4d7122982c1e75c6f58d4a278f1d74c17069b01')

build() {
  cd stargate-release-${pkgver}/src
  # for non-x86 architectures
  PLAT_FLAGS="${CFLAGS}" make distro
}

package() {
  cd stargate-release-${pkgver}/src
  PREFIX=${pkgdir}/usr make install_distro
}
