# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Audio-Solutions
_pkgname=pulse-visualizer
pkgname=${_pkgname}-bin
pkgver=1.3.1
pkgrel=2
pkgdesc="A GPU-accelerated audio visualizer for PulseAudio/PipeWire"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('GPL-3.0-only')

install=pulse-visualizer-bin.install
depends=('glibc' 'gcc-libs' 'libebur128' 'glew' 'freetype2' 'libglvnd' 'libpipewire' 'sdl3' 'libpulse' 'yaml-cpp' 'fftw')
conflicts=("${_pkgname}" "${_pkgname}"-git)
provides=("${_pkgname}")

source=("${_urlraw}/LICENSE"
        "${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-Linux.tar.gz")
sha256sums=('c53a65c2fd561c87eaabf1072ef5dcab8653042bc15308465f52413585eb6271'
            '11a4badc7e4ecbaa7f2b405af1fa01f1e0732b208c6e7ed5d69c7b62078f16c0')
sha256sums_x86_64=('e5f0c5408d439fef80ae3a19eb802c0302beeb7f455a3479a23144609975f7c3')
package() {
  cd "$srcdir" || return
  chmod +x ./install.sh
  ./install.sh "$pkgdir/usr" "skip-root"
}

