# Maintainer: kiasoc5 <kiasoc5 at tutanota dot com>
# Contributor: xantares

pkgname=stargate
pkgver=22.01.1
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
    'python-pyqt6'
    'qt6-svg'
    'rubberband'
    'sbsms'
)
makedepends=(
    'jq'
    'libsbsms'
)
optdepends=(
    'lame'
    'ffmpeg'
    'vorbis-tools'
    'python-pyqt5: qt5 backend'
)
source=("https://github.com/stargateaudio/stargate/archive/refs/tags/release-${pkgver}.tar.gz")
sha256sums=('f3c776a6ffa070647a339a029e7513bc2287b032cd6038e01cf7b6226eb4cceb')

build() {
  cd stargate-release-${pkgver}/src
  # for non-x86 architectures
  PLAT_FLAGS="${CFLAGS}" make distro
}

package() {
  cd stargate-release-${pkgver}/src
  PREFIX=${pkgdir}/usr make install_distro
}
