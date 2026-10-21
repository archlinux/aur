# Maintainer: badcast <lmecomposer@gmail.com>
# Contributor: Artem Izmaylov <support@aimp.ru>

_pkver=(6.00 3091)
pkgname=aimp
pkgver=${_pkver[0]}.${_pkver[1]}
pkgrel=1
url="https://www.aimp.ru"
pkgdesc="Powerful free audio player, converter and tag editor (v6 Beta, Unstable)"
arch=('x86_64')
conflicts=('aimp')
provides=('aimp')
license=('custom')
depends=('hicolor-icon-theme' 'gtk3' 'gdk-pixbuf2' 'cairo' 'pango' 'sqlite' 'libvorbis' 'harfbuzz')
optdepends=('libappindicator: extend app-menu support'
            'opus-tools: audio codec support'
            'aimp-skins: external skins')
source=(
   "https://aimp.ru/files/desktop/builds/aimp-${_pkver[0]}.${_pkver[1]}beta7-1-x86_64.pkg.tar.zst"
   "changelog"
)
sha256sums=('eddef8b0896945fd0b27e681c2d554d23796b93d59df34d37ed78719f9cf26f2'
            '254bd58a56fd2723460d908783f1a7d0eaf688443360f756332b0f0068570c46')
changelog=changelog

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

