# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

# Contributor Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: SierraKiloBravo <aur at hillebrand dot io>

pkgname=vieb-bin
_pkgname=vieb
pkgver=7.0.0
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
sha512sums=('3daa2e29c169a4d2fc28f0d8322282ada7a004ad95b578406ece7206e27597b9e86c8ff8606f8a5310d35de63bff359596ec4797c02c769d1f7815bd2e4a90f8')

package() {
	cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"

  # Create a symlink to the binary in /opt
  mkdir -p "${pkgdir}"/usr/bin
  ln -sf /opt/Vieb/vieb "${pkgdir}/usr/bin/vieb"
}
# vim:set ts=2 sw=2 et:
