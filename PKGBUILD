# Maintainer: Omar Roth <roth@omar.yt>
pkgname=doubletake-bin
pkgver=0.7.0
pkgrel=1
pkgdesc='AirPlay mirroring sender for Linux (prebuilt release binary)'
arch=('x86_64')
url='https://github.com/omarroth/doubletake'
license=('LGPL-3.0-or-later')
options=('!debug')
depends=(
  'glib2'
  'glibc'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-base-libs'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-plugins-ugly'
  'gst-libav'
  'libpulse'
)
optdepends=(
  'bash-completion: Bash command completion'
  'libfdk-aac: AAC-ELD audio support'
  'gst-plugin-pipewire: Wayland screen and audio capture'
  'gst-plugin-va: VA-API hardware encoding on AMD and Intel GPUs'
  'xdg-desktop-portal: Wayland capture portal integration'
)
provides=('doubletake')
conflicts=('doubletake' 'doubletake-git')
install='doubletake-bin.install'
source=(
  "${url}/releases/download/v${pkgver}/doubletake-v${pkgver}-linux-x86_64.tar.gz"
)
sha256sums=('c637d16828455a211469114de3aebc0c32d0740038f765348f8123102d4d49bc')

package() {
  cp -a --no-preserve=ownership "${srcdir}/usr" "${pkgdir}/"
  mv "${pkgdir}/usr/share/licenses/doubletake" "${pkgdir}/usr/share/licenses/${pkgname}"
}
