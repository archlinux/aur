# Maintainer: Chip Collier <photex@gmail.com>
# Upstream: PreSonus Audio Electronics, Inc.

# Based on PKGBUILD for https://aur.archlinux.org/packages/bitwig-studio

pkgname='studio-one-7'
pkgver='7.0.2.103351'
pkgrel='2'
pkgdesc='Digital audio workstation for music production, remixing and live performance'
arch=('x86_64')
url='https://www.presonus.com/'
license=('custom')
depends=('alsa-lib' 'egl-wayland' 'wayland' 'wayland-utils' 'vulkan-icd-loader' 'libjpeg-turbo' 'icu74' 'sdbus-cpp1')
optdepends=('jack' 'pipewire' 'pulseaudio' 'oss')
provides=('clap-host' 'vst3-host')
replaces=()
conflicts=()
options=(!strip)
DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download \"Studio One 7-x86_64.deb\" manually from https://my.presonus.com')
source=('manual://Studio One 7-x86_64.deb')
sha256sums=('0168f061944a672be616f3b51d9f2723c0faa0517c9c590cc5c5152db4abc64e')

package() {
  # Unpack package contents
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/

  # Fix permissions
  chmod g-w ${pkgdir}/opt
  chmod -R g-w ${pkgdir}/usr
}
