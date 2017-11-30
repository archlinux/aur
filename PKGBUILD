# Maintainer: Javier Tia <javier[dot]tia[at]gmail[dot]com>
# Old Maintainer: Viliam Pucik <viliam[dot]pucik[at]gmail[dot]com>
# Old Author: jevv

pkgname=hpmyroom
pkgver=10.11.0.0106
pkgrel=2
pkgdesc="HPE MyRoom a collaborative conferencing meetings software"
url="https://www.myroom.hpe.com"
arch=('x86_64')
license=('unknown')
depends=('alsa-lib' 'bzip2' 'dbus' 'expat' 'flac' 'fontconfig' 'freetype2' 'glib2' 'graphite' 'gst-plugins-bad' 'gst-plugins-base-libs' 'gstreamer' 'harfbuzz' 'libasyncns' 'libcap' 'libffi' 'libgcrypt' 'libglvnd' 'libgpg-error' 'libice' 'libogg' 'libpng' 'libpng12' 'libpulse' 'libsm' 'libsndfile' 'libsystemd' 'libutil-linux' 'libvorbis' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext' 'libxfixes' 'libxi' 'libxss' 'libxtst' 'lz4' 'orc' 'pcre' 'xz' 'zlib' 'libva')
source=("${url}/downloadfiles/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('c6c41a68e359d48352a0ac03f01b2b4f4fce9ead8f49a82979e5bbbeb64f8d7d')

package() {
  ar x ${pkgname}_${pkgver}_amd64.deb
  tar xf data.tar.xz --no-same-permissions --no-overwrite-dir -C ${pkgdir}
  chmod a-x ${pkgdir}/usr/share/applications/HP-myroom.desktop
  find ${pkgdir}/usr/share/hpmyroom/Resources/* -type f -exec chmod a-x {} \;
  mkdir -p ${pkgdir}/usr/lib
  cd ${pkgdir}/usr/lib
  ln -s libva.so.2.0.0 libva.so.1
  ln -s libva-x11.so.2.0.0 libva-x11.so.1
  ln -s libva-drm.so.2.0.0  libva-drm.so.1
}

# vim:set ft=sh ts=2 sw=2 et:
