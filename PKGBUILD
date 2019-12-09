# Maintainer: Mike Sager <mike at mikesager dot name>

_pkgname=synfigstudio
pkgname=${_pkgname}-appimage
pkgver=1.2.2
pkgrel=1
pkgdesc="Professional vector animation program (GUI)"
arch=('x86_64')
url="https://www.synfig.org"
license=('GPL3')
provides=('synfigstudio')
conflicts=('synfigstudio')
depends=('hicolor-icon-theme')
#depends=('gtkmm3' 'synfig' 'sdl_image')
#makedepends=('openexr' 'libmagick6' 'xorg-fonts-100dpi' 'xorg-fonts-75dpi'
#             'xorg-fonts-misc' 'xorg-fonts-type1' 'intltool' 'imagemagick')

_appimagedistrover=18.09.14
_appimagearch=linux64
_appimagecommitsuffix=286f1

source=(
    "https://github.com/synfig/synfig/releases/download/v${pkgver}/SynfigStudio-${pkgver}-${_appimagedistrover}-${_appimagearch}-${_appimagecommitsuffix}.appimage"
    "synfigstudio.desktop"
    "synfigstudio.png"
    "synfigstudio.sh"
    )
sha256sums=(
    '6c4cb9ce465aa1e1bd8fd528add089cd1bdf690847f61cceb428a8f72e5e02f9'
    'cf1d7721325196f0b606a152c7b651c0abf735cb9c72ffbdb036e30517d3f725'
    '3e6b8fd52343b942c131f51f791e6ec8bcce36a15e4538b859f01a2f5674958e'
    '17142491c74d26b8fad361f946f4d599e35991625ec6b966b88be11665816930'
    )

options=(!strip)
_filename=./SynfigStudio-${pkgver}-${_appimagedistrover}-${_appimagearch}-${_appimagecommitsuffix}.appimage

package() {
  cd "$srcdir"
  install -Dm755 "${_filename}" "${pkgdir}/opt/appimages/${_pkgname}.AppImage"
  install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
}
