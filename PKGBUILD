# Maintainer: Johann Hackl <jhackl@outlook.de>
# Maintainer: Aleksej Komarov <stylemistake@gmail.com>
# Upstream: Bitwig GmbH <support@bitwig.com>

pkgname='bitwig-studio-earlyaccess'
_pkgver='5.2.6'
pkgver=${_pkgver}
pkgrel='1'
pkgdesc='Digital audio workstation for music production, remixing and live performance - early access version'
arch=('x86_64')
url='https://www.bitwig.com/'
license=('custom')
depends=('xdg-utils' 'xcb-util-wm' 'libbsd')
optdepends=('jack' 'alsa-lib' 'oss' 'ffmpeg: MP3 support')
provides=('clap-host' 'vst-host' 'vst3-host')
replaces=()
conflicts=('bitwig-studio-legacy' 'bitwig-8-track' 'bitwig-studio')
options=(!strip)
source=("bitwig-studio-${_pkgver}.deb::https://www.bitwig.com/dl/Bitwig%20Studio/${_pkgver}/installer_linux/")
#source=("https://downloads.bitwig.com/${_pkgver}/bitwig-studio-${_pkgver}.deb")


sha256sums=('c7b52118d4d2d84f587feb6aed4a40c7950167181565c3d1666f176fe9b0ffa0')

package() {
  # Unpack package contents
  bsdtar -xf ${srcdir}/data.tar.zst -C ${pkgdir}/

  # Install license
  install -D -m644 ${pkgdir}/opt/bitwig-studio/EULA.rtf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
