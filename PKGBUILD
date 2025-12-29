# Maintainer: badcast <lmecomposer@gmail.com> or <support@imister.kz>
# Contributor: Artem Izmaylov <support@aimp.ru>

_pkver=(6.00 3029)
pkgname=aimp
pkgver=${_pkver[0]}.${_pkver[1]}
pkgrel=1
url="https://www.aimp.ru"
pkgdesc="Powerful free audio player, converter and tag editor (v6 Alpha, Unstable)"
arch=('x86_64')
conflicts=('aimp')
provides=('aimp')
license=('custom')
depends=('hicolor-icon-theme' 'gtk2' 'gdk-pixbuf2' 'cairo' 'pango' 'sqlite' 'libvorbis' 'libao' 'opus-tools')
source=(
   "https://imister.kz/linux/aimp-nightly-x86_64.pkg.tar.zst"
)
sha256sums=('f64f85eb6683024ed15e66643b09270743371f3120d55b2f5306f8175ca3d997')

package(){
   rm -fr "${srcdir}/usr/share/lintian"
   rm -fr "${srcdir}/usr/src"
   install -Dm644 "${srcdir}/opt/aimp/license.txt" "${pkgdir}/usr/share/licenses/aimp/LICENSE"
   cp -r "${srcdir}/usr" "${pkgdir}/"
   cp -r "${srcdir}/opt" "${pkgdir}/"
   find "${pkgdir}" -type d -exec chmod 755 {} \;
   find "${pkgdir}" -type f -exec chmod 644 {} \;
   chmod 755 "${pkgdir}/opt/aimp/AIMP"
   chmod 755 "${pkgdir}/opt/aimp/AIMPate"
   chmod 755 "${pkgdir}/opt/aimp/AIMPac"
}

