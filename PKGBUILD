# Maintainer: Javier Tia <javier[dot]tia[at]gmail[dot]com>
# Old Maintainer: Viliam Pucik <viliam[dot]pucik[at]gmail[dot]com>
# Old Author: jevv

pkgname=hpmyroom
pkgver=10.10.0.0108
pkgrel=1
pkgdesc="HPE MyRoom a collaborative conferencing meetings software"
url="https://www.myroom.hpe.com"
arch=('x86_64')
license=('unknown')
depends=('alsa-lib' 'bzip2' 'dbus' 'expat' 'flac' 'fontconfig' 'freetype2' 'glib2' 'graphite' 'gst-plugins-bad' 'gst-plugins-base-libs' 'gstreamer' 'harfbuzz' 'libasyncns' 'libcap' 'libffi' 'libgcrypt' 'libglvnd' 'libgpg-error' 'libice' 'libogg' 'libpng' 'libpng12' 'libpulse' 'libsm' 'libsndfile' 'libsystemd' 'libutil-linux' 'libvorbis' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext' 'libxfixes' 'libxi' 'libxss' 'libxtst' 'lz4' 'orc' 'pcre' 'xz' 'zlib')
source=("${url}/downloadfiles/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('75c181e14da1593dbaa9444a04f858dad3cf6662be599a6dc877907214844555')

package() {
  ar x ${pkgname}_${pkgver}_amd64.deb
  tar xf data.tar.xz --no-same-permissions --no-overwrite-dir -C ${pkgdir}
  chmod a-x ${pkgdir}/usr/share/applications/HP-myroom.desktop
  find ${pkgdir}/usr/share/hpmyroom/Resources/* -type f -exec chmod a-x {} \;
}

# vim:set ft=sh ts=2 sw=2 et:
