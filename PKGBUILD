# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: SierraKiloBravo <aur at hillebrand dot io>

pkgname=vieb-bin
_pkgname=vieb
pkgver=9.4.0
pkgrel=1
pkgdesc="Vim Inspired Electron Browser - Vim bindings for the web by design"
arch=('x86_64')
url="https://vieb.dev"
license=('GPL3')
depends=('c-ares'
  'ffmpeg'
  'gtk3'
  'http-parser'
  'libevent'
  'libvpx'
  'libxslt'
  'libxss'
  'minizip'
  'nss'
  're2'
  'snappy'
  'libnotify')
install="${_pkgname}.install"
source=("https://github.com/Jelmerro/Vieb/releases/download/${pkgver}/${_pkgname}-${pkgver}.pacman")
sha512sums=('37970c88901037e8f05a6917d0a4219585d83469a87960625ffee0b8dbc1a86e93c69f496c326f653b1c0ef3014c873a51c2b88018aaa13a4740a4bd8598a6b7')

package() {
	cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"

  # Create a symlink to the binary in /opt
  mkdir -p "${pkgdir}"/usr/bin
  ln -sf /opt/Vieb/vieb "${pkgdir}/usr/bin/vieb"
}
# vim:set ts=2 sw=2 et:
