# Maintainer: Johann Hackl <jhackl@outlook.de>
# Maintainer: Aleksej Komarov <stylemistake@gmail.com>
# Upstream: Bitwig GmbH <support@bitwig.com>

pkgname='bitwig-studio-earlyaccess'
_pkgver='5.0_beta_7'
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
source=("https://downloads.bitwig.com/5.0%20Beta%207/bitwig-studio-5.0-beta-7.deb")
#source=("https://downloads.bitwig.com/${_pkgver}/bitwig-studio-${_pkgver}.deb")

#beta source=("https://downloads.bitwig.com/beta/4.1/bitwig-studio-${_pkgver}.deb")
#earlyaccess source=("https://downloads.bitwig.com/beta/${_pkgver}/bitwig-studio-${_pkgver}.deb")

sha256sums=('c03549b19c9df7ec22818991e9a0db240fcdbb1caf58737b8ef168c8d629caf3')

package() {
  # Unpack package contents
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/

  # Install license
  install -D -m644 ${pkgdir}/opt/bitwig-studio/EULA.rtf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
