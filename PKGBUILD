# Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgname=vidyodesktop
pkgver=3.3.0.127
pkgrel=1
pkgdesc="VidyoDesktop(TM) video conferencing client"
arch=('i686' 'x86_64')
url="http://www.vidyo.com"
license=('custom')
install=vidyodesktop.install
options=('emptydirs')
conflicts=('vidyo')
depends=('alsa-lib' 'libidn' 'libutil-linux' 'libxv' 'libgl' 'glu'
         'glibc' 'libxfixes' 'libxrandr' 'libxss' 'glib2' 'libsm' 'libice'
         'libxrender' 'fontconfig' 'freetype2' 'libxext' 'libx11' 'libffi'
         'gcc-libs' 'zlib' 'libpng' 'zenity')
optdepends=('flashplugin: Join meetings via web browser')

if [ "$CARCH" == "i686" ]; then
  source=("https://demo.vidyo.com/upload/VidyoDesktopInstaller-sl5-TAG_VD_3_3_0_127.rpm")
  md5sums=('844ea251d103ed43245f0a93ffb724f5')
elif [ "$CARCH" == "x86_64" ]; then
  source=("https://demo.vidyo.com/upload/VidyoDesktopInstaller-sl564-TAG_VD_3_3_0_127.rpm")
  md5sums=('3580e0889df72482b089c4fa59fb2de4')
fi

package() {
  cp -dpr "${srcdir}/opt" "${pkgdir}"
  cp -dpr "${srcdir}/usr" "${pkgdir}"
  install -dm1777 "${pkgdir}/opt/vidyo/VidyoDesktop/lic"
  install -Dm0644 "${pkgdir}/opt/vidyo/VidyoDesktop/license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

