# Maintainer: kiasoc5 <kiasoc5 at tutanota dot com>
# Contributor: xantares

pkgname=stargate
pkgver=21.12.3
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
sha256sums=('d3b88e23d74e465b7c754942e277319b6d784b4ff16c83a70e935fe411809f57')

build() {
  cd stargate-release-${pkgver}/src
  # for non-x86 architectures
  PLAT_FLAGS="${CFLAGS}" make distro
}

package() {
  cd stargate-release-${pkgver}/src
  PREFIX=${pkgdir}/usr make install_distro
}
