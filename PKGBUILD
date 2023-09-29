# Maintainer: Johann Hackl <jhackl@outlook.de>
# Maintainer: Aleksej Komarov <stylemistake@gmail.com>
# Upstream: Bitwig GmbH <support@bitwig.com>

pkgname='bitwig-studio-earlyaccess'
_pkgver='5.0.10'
pkgver=${_pkgver}
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
source=("https://downloads.bitwig.com/${_pkgver}/bitwig-studio-${_pkgver}.deb")
#source=("https://downloads.bitwig.com/${_pkgver}/bitwig-studio-${_pkgver}.deb")

#beta source=("https://downloads.bitwig.com/beta/4.1/bitwig-studio-${_pkgver}.deb")
#earlyaccess source=("https://downloads.bitwig.com/beta/${_pkgver}/bitwig-studio-${_pkgver}.deb")

sha256sums=('b9c91cd0bdc3daa5c7ae98bf17cd5716f4eca96a6a7a40de4053434b49530e6f')

package() {
  # Unpack package contents
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/

  # Install license
  install -D -m644 ${pkgdir}/opt/bitwig-studio/EULA.rtf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
