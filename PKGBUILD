# Maintainer: gambarim <gambarim@pm.me>

pkgname=buzz-bin
pkgver=0.5.20
pkgrel=1
pkgdesc='Self-hostable workspace where humans and AI agents build together, on a relay you own'
arch=('x86_64')
url='https://github.com/block/buzz'
license=('Apache-2.0')
depends=(
  'alsa-lib'
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'pango'
  'webkit2gtk-4.1'
  'xdg-utils'
  'zlib'
)
options=('!strip' '!debug')
conflicts=('buzz-appimage')
source=("https://github.com/block/buzz/releases/download/desktop-v${pkgver}/Buzz_${pkgver}_amd64.deb")
sha256sums=('55c7de42bc196aed69597b01c25b3daf78aa8840f0f33174d7534e87cac71424')

package() {
  cd "${srcdir}"
  ar x "Buzz_${pkgver}_amd64.deb"
  tar xf data.tar.* -C "${pkgdir}"
}
