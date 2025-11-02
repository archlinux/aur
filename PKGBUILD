# Maintainer: badcast <lmecomposer@gmail.com>
# Contributor: Artem Izmaylov <support@aimp.ru>

_pkver=(6.00 3016)
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
sha256sums=('c521c66fa60778eb19037d9b96e6a5f54aeb96c911375ce6c35753a263bb2663')

package(){
   rm -fr "${srcdir}/usr/share/lintian"
   cp -r "${srcdir}/usr" "${pkgdir}/"
   cp -r "${srcdir}/opt" "${pkgdir}/"
   find "${pkgdir}" -type d -exec chmod 755 {} \;
   find "${pkgdir}" -type f -exec chmod 644 {} \;
   chmod 755 "${pkgdir}/opt/aimp/AIMP"
   chmod 755 "${pkgdir}/opt/aimp/AIMPate"
   chmod 755 "${pkgdir}/opt/aimp/AIMPac"
}

