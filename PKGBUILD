# Maintainer: gambarim <gambarim@pm.me>

pkgname=buzz-bin
pkgver=0.5.30
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
sha256sums=('1834e4db989637a800e481d48ea2d0a743d31d62bcb9d0361ca8d253828324d6')

package() {
  cd "${srcdir}"
  ar x "Buzz_${pkgver}_amd64.deb"
  tar xf data.tar.* -C "${pkgdir}"
}
