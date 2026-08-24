# Maintainer: Johann Hackl <jhackl@outlook.de>
# Maintainer: Aleksej Komarov <stylemistake@gmail.com>
# Upstream: Bitwig GmbH <support@bitwig.com>

pkgname='bitwig-studio-earlyaccess'
_basever='6.1'
_betaver='7'
pkgver=${_basever}b${_betaver}
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

#BETA SOURCE
source=("bitwig-studio-${_basever}-beta-${_betaver}.deb::https://www.bitwig.com/dl/Bitwig%20Studio/${_basever}%20Beta%20${_betaver}/installer_linux/")

#RELEASE SOURCE
#source=("bitwig-studio-${_basever}.deb::https://www.bitwig.com/dl/Bitwig%20Studio/${_basever}/installer_linux/")


sha256sums=('f7177e791e3dbff6bd99c69a73641ef7a79145857f04a4543dd1b474fcc23877')

package() {
  # Unpack package contents
  bsdtar -xf ${srcdir}/data.tar.zst -C ${pkgdir}/

  # Install license
  install -D -m644 ${pkgdir}/opt/bitwig-studio/EULA.rtf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
