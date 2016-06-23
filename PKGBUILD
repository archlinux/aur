# Maintainer: Aleksej Komarov <stylemistake@gmail.com>
# Maintainer: MKzero <info[at]linux-web-development[dot]de>
# Contributor: Ferenc Gergely Szilagyi <ferenc.szilagyi@rocket-internet.de>
# Contributor: Renaud Lessard Larouche <sigmao@gmail.com>
# Contributor: Ben Sherman <sherman@mycornerofthe.net>
# Contributor: Nils Werner <nils.werner@gmail.com>
# Upstream: Bitwig GmbH <support@bitwig.com>

# If you find problems with the package, create an issue on Github:
# https://github.com/stylemistake/bitwig-studio-aur

pkgname='bitwig-studio'
pkgver='1.3.11'
pkgrel='1'
pkgdesc='Music production system for production, remixing and performance'
arch=('x86_64')
url='https://www.bitwig.com/'
license=('custom')
depends=('jack' 'xdg-utils' 'zenity' 'xcb-util-wm' 'libbsd')
optdepends=('alsa-lib' 'oss' 'ffmpeg: MP3 support')
provides=('bitwig-studio')
replaces=('bitwig-studio-demo')
conflicts=('bitwig-studio-demo' 'bitwig-studio-demo-rc')
options=(!strip)
source=("https://downloads.bitwig.com/stable/${pkgver}/bitwig-studio-${pkgver}.deb")
md5sums=('c7ec70056628288a3b68066e1219e0af')

package() {
  # Unpack package contents
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/

  # Install license
  install -D -m644 ${pkgdir}/opt/bitwig-studio/EULA.rtf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
