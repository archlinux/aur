# Maintainer: Mare Devi <me@maredevi.moe>
pkgname=astro-editor-bin
pkgver=1.0.17
pkgrel=1
pkgdesc="A schema-aware markdown editor for Astro content collections"
arch=('x86_64')
url="https://github.com/dannysmith/astro-editor"
license=('AGPL-3.0-or-later')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'libsoup3'
  'pango'
)
provides=('astro-editor')
conflicts=('astro-editor')
source=("${pkgname}-${pkgver}.deb::https://github.com/dannysmith/astro-editor/releases/download/v${pkgver}/Astro.Editor_${pkgver}_amd64.deb")
sha256sums=('1a24f1e477f45bcee856e04a0721cbff48200413cdbfdb5165866d3c207a2bd6')

package() {
  tar -xzf data.tar.gz -C "${pkgdir}"

  # Rename desktop file to follow AUR naming conventions (remove spaces)
  if [ -f "${pkgdir}/usr/share/applications/Astro Editor.desktop" ]; then
    mv "${pkgdir}/usr/share/applications/Astro Editor.desktop" "${pkgdir}/usr/share/applications/astro-editor.desktop"
  fi
}
