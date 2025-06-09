# Contributor: Mike Sager <mike at mikesager dot name>
# Contributor: tee < teeaur at duck dot com >

_pkgname=synfigstudio
pkgname="${_pkgname}-appimage"
pkgver=1.5.3
pkgrel=1
pkgdesc="Professional vector animation program (GUI)"
arch=('x86_64')
url="https://www.synfig.org"
license=('GPL-3.0-only')
provides=('synfigstudio')
conflicts=('synfigstudio')
depends=('hicolor-icon-theme')
#depends=('gtkmm3' 'synfig' 'sdl_image')
#makedepends=('openexr' 'libmagick6' 'xorg-fonts-100dpi' 'xorg-fonts-75dpi'
#             'xorg-fonts-misc' 'xorg-fonts-type1' 'intltool' 'imagemagick')

_appimagedistrover=2024.08.23
_appimagearch=linux64
_appimagecommitsuffix=3b7c5

source=(
    "https://github.com/synfig/synfig/releases/download/v${pkgver}/SynfigStudio-${pkgver}-${_appimagedistrover}-${_appimagearch}-${_appimagecommitsuffix}.appimage"
    "synfigstudio.desktop"
    "synfigstudio.png"
    "synfigstudio.sh"
    )
sha256sums=('704c56477e7f93622e75264bbb1f801efb4894e8e33a1e9cf3cf8e246770fb8b'
            'cf1d7721325196f0b606a152c7b651c0abf735cb9c72ffbdb036e30517d3f725'
            '3e6b8fd52343b942c131f51f791e6ec8bcce36a15e4538b859f01a2f5674958e'
            '5150126853ec6ec646fb9bb02d62cf0346d6e362a83acc8be604b34cbf7ebbab')

options=(!strip)
_filename=./SynfigStudio-${pkgver}-${_appimagedistrover}-${_appimagearch}-${_appimagecommitsuffix}.appimage

package() {
  cd "$srcdir"
  install -Dm755 "${_filename}" "${pkgdir}/opt/appimages/${_pkgname}.AppImage"
  install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
}
