# Maintainer: gambarim <gambarim@pm.me>

pkgname=buzz-bin
pkgver=1.0.6
pkgrel=1
pkgdesc='Self-hostable workspace where humans and AI agents build together, on a relay you own'
arch=('x86_64')
url='https://github.com/block/buzz-app'
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
source=("${url}/releases/download/v${pkgver}/Buzz_${pkgver}_amd64.deb")
sha256sums=('762ff07136e3ca138cd0647f8f15c5275a29428779972b15fe1411196c79b327')

package() {
  cd "${srcdir}"
  ar p "Buzz_${pkgver}_amd64.deb" data.tar.gz | bsdtar -xf - -C "${pkgdir}"
  ln -s '../lib/Buzz Foundation/bin/buzz' "${pkgdir}/usr/bin/buzz"
  ln -s Buzz "${pkgdir}/usr/bin/buzz-desktop"
}
