# Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgname=vidyodesktop
pkgver=3.5.4.010
pkgrel=3
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
         'gcc-libs' 'zlib' 'libpng' 'qtwebkit' 'zenity')
optdepends=('flashplugin: Join meetings via web browser')

source_i686=("https://demo.vidyo.com/upload/VidyoDesktopInstaller-ubuntu-TAG_VD_3_5_4_010.deb")
md5sums_i686=('e61a868989e4d1bf89f7a440bd8d9cc7')

source_x86_64=("https://demo.vidyo.com/upload/VidyoDesktopInstaller-ubuntu64-TAG_VD_3_5_4_010.deb")
md5sums_x86_64=('457f6eacbdb20dff7ce59a9ef8215bb4')

prepare() {
  tar -zxf data.tar.gz
}

package() {
  cp -dpr "${srcdir}/opt" "${pkgdir}"
  cp -dpr "${srcdir}/usr" "${pkgdir}"
  install -dm1777 "${pkgdir}/opt/vidyo/VidyoDesktop/lic"
  install -Dm0644 "${pkgdir}/opt/vidyo/VidyoDesktop/license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

