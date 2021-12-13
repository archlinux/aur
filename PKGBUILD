# Author: Xenhat Hex (me@xenh.at)
# Maintainer: Xenhat Hex (me@xenh.at)

# shellcheck disable=SC2034,SC3030
pkgname=alchemy-next-viewer-bin
_pkgfolder="Alchemy_Project_AgileAkita_6_5_1_1275_x86_64"
pkgver=6.5.1.1275
pkgrel=1
pkgdesc="Next generation of the Alchemy Viewer, an open-source Second Life client - Official CI Project build"
arch=('x86_64')
url=https://www.alchemyviewer.org
license=('LGPL')
depends=(dbus-glib glu gtk3 lib32-libidn lib32-libsndfile lib32-util-linux lib32-zlib libgl libidn libjpeg-turbo libpng libxss libxml2 mesa nss openal sdl2 vlc zlib)
optdepends=(
  'alsa-lib: ALSA support'
  'freealut: OpenAL support'
  'gamemode: Gamemode support'
  'lib32-libidn11: SLVoice support'
  'libpulse: PulseAudio support'
  'mesa-libgl: Intel, Radeon, Nouveau support'
  'nvidia-libgl: NVIDIA support'
  'nvidia-utils: NVIDIA support')
provides=('alchemy-next')
source=(
        "Alchemy_Project_AgileAkita_6_5_1_1275_x86_64-935.tar.bz2"::'https://git.alchemyviewer.org/alchemy/alchemy-next/-/package_files/935/download'
        'alchemy-next.desktop')
sha1sums=('1ef1d35773fd91e5cf16419a303b4d6986fabbcd'
          'ceda56749a643b5baa17a236dfb89f76b8350f78')
b2sums=('47b884af32fae38896f722df7dcd003c487748819827f8ebbd79ba911a8e1ecf60d1c8e7ad727b5a67dc3b05125287511e401dd57f18ee35534edcf66e799b36'
        '152ed008f85eb748528e74d07fcce577f3d6e7ebf4e1224242c10af9be420d9513db4ad0b252600ebac26949f69d73809554fe6a6d1bf2841af28e0da65ffc91')
pkgver() {
  echo "${pkgver}"
}
strip() {
  # package is already pre-stripped when desired
  true
}
package() {
  mkdir -p "${pkgdir}"/usr/share/applications
  mkdir -p "${pkgdir}"/opt
  mv "${srcdir}/${_pkgfolder}/" "$pkgdir/opt/$pkgname/"
  install -Dm644 "alchemy-next.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i 's/Name=Alchemy/Name=Alchemy Project '"${_projectname}"'/' "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
