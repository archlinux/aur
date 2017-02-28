# Maintainer: Aleksej Komarov <stylemistake@gmail.com>
# Maintainer: MKzero <info[at]linux-web-development[dot]de>
# Upstream: Bitwig GmbH <support@bitwig.com>

# If you find problems with the package, create an issue on Github:
# https://github.com/stylemistake/bitwig-studio-aur

pkgname='bitwig-studio'
pkgver='2.0.0'
_pkgver=2.0
pkgrel='1'
pkgdesc='Digital audio workstation for music production, remixing and live performance'
arch=('x86_64')
url='https://www.bitwig.com/'
license=('custom')
depends=('jack' 'xdg-utils' 'zenity' 'xcb-util-wm' 'libbsd')
optdepends=('alsa-lib' 'oss' 'ffmpeg: MP3 support')
provides=('bitwig-studio')
replaces=()
conflicts=()
options=(!strip)
source=("https://downloads.bitwig.com/stable/${_pkgver}/bitwig-studio-${_pkgver}.deb")
md5sums=('47e07a51106b703365f1f2b0a1fc02b8')

package() {
  # Unpack package contents
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/

  # Install license
  install -D -m644 ${pkgdir}/opt/bitwig-studio/EULA.rtf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
