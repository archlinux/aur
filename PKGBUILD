# Maintainer: Jonathon Fernyhough <jonathon at_manjaro dot_org>
# Contributor: Aleksej Komarov <stylemistake@gmail.com>
# Contributor: MKzero <info[at]linux-web-development[dot]de>
# Upstream: Bitwig GmbH <support@bitwig.com>

# PKGBUILD taken wholesale from stylemistake's bitwig-studio package

pkgname='bitwig-studio-beta'
pkgver='2.3beta1'
_pkgver='2.3'
pkgrel='1'
pkgdesc='Digital audio workstation for music production, remixing and live performance'
arch=('x86_64')
url='https://www.bitwig.com/'
license=('custom')
# Deps from bitwig-studio package
#depends=('jack' 'xdg-utils' 'zenity' 'xcb-util-wm' 'libbsd')
# Deps as suggested by namcap...
depends=('jack' 'gtk2' 'gtk3' 'lib32-gcc-libs' 'libbsd' 'xcb-util' 'xcb-util-wm' 'xdg-utils' 'zenity')
optdepends=('alsa-lib' 'oss' 'ffmpeg: MP3 support')
provides=('bitwig-studio')
conflicts=('bitwig-studio' 'bitwig-studio-legacy' 'bitwig-8-track')
options=(!strip)
source=("https://downloads.bitwig.com/beta/${_pkgver}/bitwig-studio-${pkgver}.deb")
sha256sums=('ae1e4c8b5551d0d13497b6ca0987ae6cca9b4f722b00815d4ccfcd8e7a8d4a52')

package() {
  # Unpack package contents
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/

  # Install license
  install -D -m644 ${pkgdir}/opt/bitwig-studio/EULA.rtf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
