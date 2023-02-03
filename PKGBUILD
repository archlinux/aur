# Maintainer: Johann Hackl <jhackl@outlook.de>
# Maintainer: Aleksej Komarov <stylemistake@gmail.com>
# Upstream: Bitwig GmbH <support@bitwig.com>

pkgname='bitwig-studio-earlyaccess'
pkgver='4.4.7'
_pkgver='4.4.7'
pkgrel='1'
pkgdesc='Digital audio workstation for music production, remixing and live performance - early access version'
arch=('x86_64')
url='https://www.bitwig.com/'
license=('custom')
depends=('xdg-utils' 'xcb-util-wm' 'libbsd')
optdepends=('jack' 'alsa-lib' 'oss' 'ffmpeg: MP3 support')
provides=('bitwig-studio-earlyaccess')
replaces=()
conflicts=('bitwig-studio-legacy' 'bitwig-8-track' 'bitwig-studio')
options=(!strip)
source=("https://downloads.bitwig.com/4.4.7/bitwig-studio-4.4.7.deb")

#beta source=("https://downloads.bitwig.com/beta/4.1/bitwig-studio-${_pkgver}.deb")
#earlyaccess source=("https://downloads.bitwig.com/beta/${_pkgver}/bitwig-studio-${_pkgver}.deb")

sha256sums=('9d3b5e164f05157ab01acf22c9ffecc67438a805dfce98923611f2425d879708')

package() {
  # Unpack package contents
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/

  # Install license
  install -D -m644 ${pkgdir}/opt/bitwig-studio/EULA.rtf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
