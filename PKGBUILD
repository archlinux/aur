# Maintainer: Johann Hackl <jhackl@outlook.de>
# Maintainer: Aleksej Komarov <stylemistake@gmail.com>
# Upstream: Bitwig GmbH <support@bitwig.com>

pkgname='bitwig-studio-earlyaccess'
_basever='6.1.7'
_betaver='7'
#pkgver=${_basever}b${_betaver}
pkgver=${_basever}
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
#source=("bitwig-studio-${_basever}-beta-${_betaver}.deb::https://www.bitwig.com/dl/Bitwig%20Studio/${_basever}%20Beta%20${_betaver}/installer_linux/")

#RELEASE SOURCE
source=("bitwig-studio-${_basever}.deb::https://www.bitwig.com/dl/Bitwig%20Studio/${_basever}/installer_linux/")

sha256sums=('c2ea92efd7cee30ef7b6c945acd8550797d81e51332a9761cc09453e0f11d7ab')

package() {
  # Unpack package contents
  bsdtar -xf ${srcdir}/data.tar.zst -C ${pkgdir}/

  # Install license
  install -D -m644 ${pkgdir}/opt/bitwig-studio/EULA.rtf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
