# Maintainer: badcast <lmecomposer@gmail.com>
# Contributor: Artem Izmaylov <support@aimp.ru>

_pkver=(6.00 3094)
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
sha256sums=('d23c8a0f565696129b119d538d7c6207e7347def81ce6eee65ebeffdd35d2c69'
            '119a21b960b0f65998fe23c864118a2952736e67734b8aa00e83d7fac555eaf1')
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

