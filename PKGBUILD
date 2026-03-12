# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Audio-Solutions
_pkgname=pulse-visualizer
pkgname=${_pkgname}-bin
pkgver=1.3.7
pkgrel=1
pkgdesc="A GPU-accelerated audio visualizer for PulseAudio/PipeWire"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('GPL-3.0-only')

install=pulse-visualizer-bin.install
depends=('glibc' 'gcc-libs' 'libebur128' 'glew' 'freetype2' 'libglvnd' 'libpipewire' 'sdl3' 'libpulse' 'yaml-cpp' 'fftw' 'sdl3_image')
conflicts=("${_pkgname}" "${_pkgname}"-git)
provides=("${_pkgname}")

source=("${_urlraw}/LICENSE"
        "${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-Linux.tar.gz")
sha256sums=('c53a65c2fd561c87eaabf1072ef5dcab8653042bc15308465f52413585eb6271'
            'd080c882c568252d20f1b150804b21b4da06d5a34060b0b025e92bf718cae6a2')
sha256sums_x86_64=('e7fd8bb38eafcdeb27e3942c96b3f0f6197d79d530927acc9600632114b91489')

package() {
  cd "${srcdir}" || return

  chmod +x ./install.sh
  ./install.sh "${pkgdir}/usr" "skip-root"
}
