# Maintainer: badcast <lmecomposer@gmail.com>
# Contributor: Artem Izmaylov <support@aimp.ru>

_pkver=(6.00 3015a)
pkgname=aimp
pkgver=${_pkver[0]}.${_pkver[1]}
pkgrel=3
url="https://www.aimp.ru"
pkgdesc="A powerful free audio player (v6 Alpha, Unstable)"
arch=('x86_64')
conflicts=('aimp')
provides=('aimp')
license=('Freeware')
depends=('hicolor-icon-theme' 'gtk2' 'gdk-pixbuf2' 'cairo' 'pango' 'sqlite' 'libvorbis' 'libao' 'opus-tools')
source=("https://imister.kz/linux/aimp-${_pkver[0]}-${_pkver[1]}-${arch}.pkg.tar.zst")
sha256sums=('270d7c472d9ff671111a99b33bce71c474f3b90263a9b60d37ac3322c3730e24')

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

