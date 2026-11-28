# Maintainer: n0yd
_pkgname=project-avalanche
pkgname=project-avalanche-bin
pkgver=0.4.2
pkgrel=1
pkgdesc='Native Linux port of SSX (2012)'
arch=('x86_64')
url='https://github.com/MnkyArts/ProjectAvalanche'
license=('MIT')
depends=('glibc>=2.39' 'alsa-lib' 'vulkan-driver' 'wayland' 'libx11' 'libxkbcommon' 'xdg-desktop-portal')
optdepends=('pipewire: audio via PipeWire' 'pulseaudio: audio via PulseAudio')
provides=('project-avalanche')
conflicts=('project-avalanche')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/MnkyArts/ProjectAvalanche/releases/download/v${pkgver}/ProjectAvalanche-linux-x64.tar.gz")
sha256sums=('cb8dcb860b3b32b691dec080771c3d335b7c2b6494a132be6c79c97a3c7b97dc')

package() {
  install -dm755 "${pkgdir}/opt/${_pkgname}"
  cp -a ./* "${pkgdir}/opt/${_pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/project-avalanche" "${pkgdir}/usr/bin/project-avalanche"
}
