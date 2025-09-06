# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Audio-Solutions
_pkgname=pulse-visualizer
pkgname=${_pkgname}-bin
pkgver=1.3.3
pkgrel=1
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
            'f00685045c62bdd53c452d18643e01fdde7d93a019c2b074e1bc611659ad3ce4')
sha256sums_x86_64=('19d8cf4aea81c6c2a03576e114ef8e7ffe4fda1c43f34a11b7faec1fcb3fccb1')

package() {
  cd "$srcdir" || return

  chmod +x ./install.sh
  ./install.sh "$pkgdir/usr" "skip-root"
}
