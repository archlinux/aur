# Maintainer: badcast <lmecomposer@gmail.com>
# Contributor: Artem Izmaylov <support@aimp.ru>

_pkver=(6.00 3026)
pkgname=aimp
pkgver=${_pkver[0]}.${_pkver[1]}
pkgrel=1
url="https://www.aimp.ru"
pkgdesc="A powerful free audio player (v6 Alpha, Unstable)"
arch=('x86_64')
conflicts=('aimp')
provides=('aimp')
license=('Freeware')
depends=('hicolor-icon-theme' 'gtk2' 'gdk-pixbuf2' 'cairo' 'pango' 'sqlite' 'libvorbis' 'libao' 'opus-tools')
source=("https://www.aimp.ru/files/windows/builds/aimp-nightly-${arch}.pkg.tar.zst")
sha256sums=('89e505d4acc5da017523795f1fde52d1b877ae09000a082e955735257f4ab534')

package(){
   rm -fr "${srcdir}/usr/share/lintian"
   rm -fr "${srcdir}/usr/src"
   cp -r "${srcdir}/usr" "${pkgdir}/"
   cp -r "${srcdir}/opt" "${pkgdir}/"
   find "${pkgdir}" -type d -exec chmod 755 {} \;
   find "${pkgdir}" -type f -exec chmod 644 {} \;
   chmod 755 "${pkgdir}/opt/aimp/AIMP"
   chmod 755 "${pkgdir}/opt/aimp/AIMPate"
   chmod 755 "${pkgdir}/opt/aimp/AIMPac"
}

