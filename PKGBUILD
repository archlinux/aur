# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: SierraKiloBravo <aur at hillebrand dot io>

pkgname=vieb-bin
_pkgname=vieb
pkgver=9.2.1
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
sha512sums=('45e8f59c91a4ee9360433abff94dfc7beadfb5b56bf599623fc7f7284397b45203a71a4efe8d9a98859bf85604d77ba8ff8d3150ddf08a12b3c023b125bc6275')

package() {
	cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"

  # Create a symlink to the binary in /opt
  mkdir -p "${pkgdir}"/usr/bin
  ln -sf /opt/Vieb/vieb "${pkgdir}/usr/bin/vieb"
}
# vim:set ts=2 sw=2 et:
