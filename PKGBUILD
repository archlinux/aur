# Maintainer: gambarim <gambarim@pm.me>

pkgname=buzz-bin
pkgver=0.5.3
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
sha256sums=('ae20163ef481ccbf3531b9806996d7580a3a24f9258a54698c75fdcb8b16f14b')

package() {
  cd "${srcdir}"
  ar x "Buzz_${pkgver}_amd64.deb"
  tar xf data.tar.* -C "${pkgdir}"
}
