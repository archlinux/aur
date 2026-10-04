# Maintainer: badcast <lmecomposer@gmail.com> or <support@imister.kz>
# Contributor: Artem Izmaylov <support@aimp.ru>

_pkver=(6.00 3088)
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
   "https://aimp.ru/files/desktop/builds/aimp-${_pkver[0]}.${_pkver[1]}beta7-1-x86_64.pkg.tar.zst"
   "changelog"
)
sha256sums=('4d5cdab5e758490c57a62b10c6d6e9e2a049f250b64315c99904ec24b1cbf48f'
            '61e62ba0f4696e46d2675ccb2c58d10c8c52c414de1a7dc6131109b5c71f6c8a')
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

