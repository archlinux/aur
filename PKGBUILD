# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: SierraKiloBravo <aur at hillebrand dot io>

_pkgname=vieb
pkgname=${_pkgname}-bin
pkgver=12.6.0
pkgrel=1
pkgdesc="Vim Inspired Electron Browser - Vim bindings for the web by design"
arch=('x86_64')
url="https://${_pkgname}.dev"
license=('GPL-3.0')
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
sha512sums=('480d464a291bda8e311bda6c6abae564a97bfd1044009372b4146060ed0a450f42ea6f9642579c373eac73165a11f3007752746be41a8c943c6a6f7aef166d9b')

package() {
  cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"

  # Create a symlink to the binary in /opt
  mkdir -p "${pkgdir}"/usr/bin
  ln -sf /opt/Vieb/vieb "${pkgdir}/usr/bin/${_pkgname}"
}
