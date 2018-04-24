# Maintainer: Javier Tia <javier[dot]tia[at]gmail[dot]com>
# Old Maintainer: Viliam Pucik <viliam[dot]pucik[at]gmail[dot]com>
# Old Author: jevv

pkgname=hpmyroom
pkgver=10.13.0.0225
pkgrel=1
pkgdesc="HPE MyRoom a collaborative conferencing meetings software"
url="https://www.myroom.hpe.com"
arch=('x86_64')
license=('unknown')
depends=('alsa-lib' 'bzip2' 'dbus' 'expat' 'flac' 'fontconfig' 'freetype2' 'glib2' 'graphite' 'gst-plugins-bad' 'gst-plugins-base-libs' 'gstreamer' 'harfbuzz' 'libasyncns' 'libcap' 'libffi' 'libgcrypt' 'libglvnd' 'libgpg-error' 'libice' 'libogg' 'libpng' 'libpng12' 'libpulse' 'libsm' 'libsndfile' 'libsystemd' 'libutil-linux' 'libvorbis' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext' 'libxfixes' 'libxi' 'libxss' 'libxtst' 'lz4' 'orc' 'pcre' 'xz' 'zlib' 'libva')
source=("${url}/downloadfiles/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('9425714fa77811a0ac9fa959c9ed57e31f8c86875682da6a9c19b048c7388069')

package() {
  ar x ${pkgname}_${pkgver}_amd64.deb
  tar xf data.tar.xz --no-same-permissions --no-overwrite-dir -C ${pkgdir}
  chmod a-x ${pkgdir}/usr/share/applications/HP-myroom.desktop
  find ${pkgdir}/usr/share/hpmyroom/Resources/* -type f -exec chmod a-x {} \;
  mkdir -p ${pkgdir}/usr/lib
  cd ${pkgdir}/usr/lib
  ln -s libva.so.2 libva.so.1
  ln -s libva-x11.so.2 libva-x11.so.1
  ln -s libva-drm.so.2  libva-drm.so.1
}

# vim:set ft=sh ts=2 sw=2 et:
