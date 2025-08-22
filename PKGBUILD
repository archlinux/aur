# Maintainer: Johann Hackl <jhackl@outlook.de>
# Maintainer: Aleksej Komarov <stylemistake@gmail.com>
# Upstream: Bitwig GmbH <support@bitwig.com>

pkgname='bitwig-studio-earlyaccess'
_pkgver='5.3.13'
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
#source=("bitwig-studio-5.3-beta-9.deb::https://www.bitwig.com/dl/Bitwig%20Studio/5.3%20Beta%209/installer_linux//")
source=("bitwig-studio-${_pkgver}.deb::https://www.bitwig.com/dl/Bitwig%20Studio/${_pkgver}/installer_linux/")


sha384sums=('767280d5f1430ce615bac870088767ae63137f9da8262695801a0020d71dd3ab2861dac5a9fd78d7e492eca1288352de')

package() {
  # Unpack package contents
  bsdtar -xf ${srcdir}/data.tar.zst -C ${pkgdir}/

  # Install license
  install -D -m644 ${pkgdir}/opt/bitwig-studio/EULA.rtf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
