# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Audio-Solutions
_pkgname=pulse-visualizer
pkgname=${_pkgname}-bin
pkgver=1.3.2
pkgrel=3
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
            '58a43588304197a9599381f2b2b97fb78364a97d4a3d5595fb7fac575c69c69a')
sha256sums_x86_64=('c67c3f46823bf1bd31c3ade9fe3f285cda6bca2a7067e500f46b2c1207198601')
package() {
  cd "$srcdir" || return
  chmod +x ./install.sh
  ./install.sh "$pkgdir/usr" "skip-root"
}

