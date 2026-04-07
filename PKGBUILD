# Maintainer: badcast <lmecomposer@gmail.com> or <support@imister.kz>
# Contributor: Artem Izmaylov <support@aimp.ru>

_pkver=(6.00 3055)
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
            'opus-tools: audio codec support')
source=(
   "https://aimp.ru/files/desktop/builds/aimp_${_pkver[0]}-${_pkver[1]}b-x86_64.pkg.tar.zst"
   "changelog"
)
sha256sums=('957ee9afab0d6c8cc9eb7f096a0d9ef9f4004eeeb80df723cf3e6fc3681fdcb1'
            'bb266942a448b8991d67a0c750cb35f404b250b4f985093db0cf404e134d6dfc')
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

