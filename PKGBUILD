# Maintainer: Aleksej Komarov <stylemistake@gmail.com>
# Upstream: Bitwig GmbH <support@bitwig.com>

pkgname='bitwig-studio'
pkgver='6.0.8'
_pkgver='6.0.8'
pkgrel='1'
pkgdesc='Digital audio workstation for music production, remixing and live performance'
arch=('x86_64')
url='https://www.bitwig.com/'
license=('custom')
depends=('xdg-utils' 'xcb-util-wm' 'libbsd')
optdepends=('jack' 'alsa-lib' 'oss' 'ffmpeg: MP3 support')
provides=('clap-host' 'vst-host' 'vst3-host')
replaces=()
conflicts=('bitwig-studio-legacy' 'bitwig-8-track')
options=(!strip)
source=("bitwig-studio-${_pkgver}.deb::https://www.bitwig.com/dl/Bitwig%20Studio/${_pkgver}/installer_linux/")
sha256sums=('aae15b90ea8488f44dcd97b0b72c96e8cd0e7d8a68d870f539d5cdcecd44cb6d')

package() {
  # Unpack package contents
  bsdtar -xf ${srcdir}/data.tar.zst -C ${pkgdir}/

  # Install license
  install -D -m644 ${pkgdir}/opt/bitwig-studio/EULA.rtf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
