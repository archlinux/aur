# Maintainer: Aleksej Komarov <stylemistake@gmail.com>
# Upstream: Bitwig GmbH <support@bitwig.com>

# If you find problems with the package, create an issue on Github:
# https://github.com/stylemistake/bitwig-studio-aur

pkgname='bitwig-studio-legacy'
pkgver='1.3.16'
pkgrel='1'
pkgdesc='Digital audio workstation for music production, remixing and live performance'
arch=('x86_64')
url='https://www.bitwig.com/'
license=('custom')
depends=('jack' 'xdg-utils' 'zenity' 'xcb-util-wm' 'libbsd')
optdepends=('alsa-lib' 'oss' 'ffmpeg: MP3 support')
provides=('bitwig-studio')
replaces=()
conflicts=('bitwig-studio' 'bitwig-8-track')
options=(!strip)
source=("https://downloads.bitwig.com/stable/${pkgver}/bitwig-studio-${pkgver}.deb")
md5sums=('d5229750564c8226b9705876000c3521')

package() {
  # Unpack package contents
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/

  # Install license
  install -D -m644 ${pkgdir}/opt/bitwig-studio/EULA.rtf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
