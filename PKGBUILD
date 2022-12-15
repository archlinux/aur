# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: SierraKiloBravo <aur at hillebrand dot io>

pkgname=vieb-bin
_pkgname=vieb
pkgver=9.5.0
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
sha512sums=('cecec58ced4e2619072b4ab466dc9e7fc3624815c97ed63e92147651f45bb42313d2d84dff9e6737fe268fe024c0f1dabe771a418f27aef0311f69a7b21ed3ea')

package() {
	cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"

  # Create a symlink to the binary in /opt
  mkdir -p "${pkgdir}"/usr/bin
  ln -sf /opt/Vieb/vieb "${pkgdir}/usr/bin/vieb"
}
# vim:set ts=2 sw=2 et:
