# Maintainer: acroarch
# Contributor: falkTX <falktx@falktx.com>

pkgname=clara-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Audio Plugin Host (fork with UI/UX enhancements, modal tools, dynamic cable gradients, and session safety - binary release)"
arch=('x86_64')
url="https://github.com/acropolis914/Clara"
license=('GPL-2.0-or-later')
depends=(
  'alsa-lib'
  'glibc'
  'hicolor-icon-theme'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxrandr'
  'qt6-wayland'
  'wayland'
  'python-rich'
  'python-pyqt6'
  'sdl2'
  'qt6-base'
  'qt6-svg'
  'fluidsynth'
  'liblo'
  'file'
  'libsndfile'
  'ttf-nerd-fonts-symbols'
)
optdepends=(
  'jack: for using carla/clara with JACK'
  'lv2-host: for the LV2 plugin'
  'vst-host: for the VST plugin'
  'python-pyliblo: OSC control support'
  'python-rdflib: LADSPA-RDF support'
)
provides=('carla' 'carla-git' 'clara' 'clara-git' 'clap-host' 'dssi-host' 'ladspa-host' 'lv2-host' 'vst3-host' 'vst-host')
conflicts=('carla' 'carla-git' 'clara' 'clara-git')
source=("https://github.com/acropolis914/Clara/releases/download/v${pkgver}/clara-bin-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('SKIP')

package() {
  bsdtar -xf "$srcdir/clara-bin-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "$pkgdir" \
    --exclude '.PKGINFO' --exclude '.MTREE'
}
