# Maintainer: MegalithOfficial <gekocakaya@gmail.com>
pkgname=basalt-launcher-dev-bin
pkgver=1.0.0.dev.5.1
pkgrel=1
pkgdesc="A polished Minecraft launcher with practical instance and content management (development build)"
arch=('x86_64')
url="https://github.com/MegalithOfficial/basalt-launcher"
license=('GPL-3.0-only')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
makedepends=('libarchive')
provides=('basalt-launcher')
conflicts=('basalt-launcher' 'basalt-launcher-bin')
options=('!strip' '!debug')
source_x86_64=("${pkgname}-${pkgver}.deb::https://github.com/MegalithOfficial/basalt-launcher/releases/download/v1.0.0-dev.5.1/Basalt.Launcher_1.0.0_amd64.deb")
sha256sums_x86_64=('4296b017dc6c12669780e03f40313a3c913d5b6a6a66901d9d6f57708128745a')

package() {
  bsdtar -xf "${pkgname}-${pkgver}.deb"
  bsdtar -xf data.tar.* -C "${pkgdir}"
  mv "${pkgdir}/usr/share/applications/Basalt Launcher.desktop" \
    "${pkgdir}/usr/share/applications/basalt-launcher.desktop"
}
