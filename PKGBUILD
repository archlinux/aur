# Author: Xenhat Hex (me@xenh.at)
# Maintainer: Xenhat Hex (me@xenh.at)

# shellcheck disable=SC2034,SC3030
pkgname=alchemy-next-viewer-bin
pkgver=6.5.1.1271
_downloadID=926
_projectname="AgileAkita"
_pkgfolder="Alchemy_Project_${_projectname}_""$(echo "${pkgver}" | tr '.' '_')""_x86_64"
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
        "${_pkgfolder}-${_downloadID}.tar.bz2"::'https://git.alchemyviewer.org/alchemy/alchemy-next/-/package_files/'"${_downloadID}"'/download'
        'alchemy-next.desktop')
sha1sums=('0a2d5addd6468019857a0b09f347e8113710005e'
          'ceda56749a643b5baa17a236dfb89f76b8350f78')
b2sums=('5e5bbb2baeb8e7d70ec47cd6b7e147df3c9f53eaa02260510f12e9204cd39b4ac6ec15147c8f4dc300217b92e6fe2bf3f3914ed4e5faaf317db1d87230d33e08'
        '152ed008f85eb748528e74d07fcce577f3d6e7ebf4e1224242c10af9be420d9513db4ad0b252600ebac26949f69d73809554fe6a6d1bf2841af28e0da65ffc91')
pkgver() {
  echo "${pkgver}"
}
package() {
  mkdir -p "${pkgdir}"/usr/share/applications
  mkdir -p "${pkgdir}"/opt
  mv "${srcdir}/${_pkgfolder}" "$pkgdir/opt/$pkgname"
  install -Dm644 "alchemy-next.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i 's/Name=Alchemy/Name=Alchemy Project '"${_projectname}"'/' "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
