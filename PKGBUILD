# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=webtorrent-desktop-bin
_pkgname=webtorrent-desktop
pkgver=0.8.0
pkgrel=1
pkgdesc="Streaming torrent client."
arch=('i686' 'x86_64')
url="https://webtorrent.io/desktop"
license=('MIT')
depends=('gconf')
provides=('webtorrent-desktop')
conflicts=('webtorrent-desktop' 'webtorrent-desktop-git')
source_i686=("https://github.com/feross/${_pkgname}/releases/download/v${pkgver}/WebTorrent-v${pkgver}-linux-ia32.zip")
source_x86_64=("https://github.com/feross/${_pkgname}/releases/download/v${pkgver}/WebTorrent-v${pkgver}-linux-x64.zip")
sha256sums_i686=('7919ed5ae6c47cafba425238fa8ecf9ad5a77c50b93130b3374d7c2e6b740f9f')
sha256sums_x86_64=('a79399c6b773fb6c0ac3748403bd54dcd2d46a87d8e3773fd39d68bc881a7f1d')

[ "$CARCH" = "i686" ]   && _platform=ia32
[ "$CARCH" = "x86_64" ] && _platform=x64

package() {
  install -dm755 "${pkgdir}/usr/share"
  install -dm755 "${pkgdir}/usr/bin"

  cp -a "WebTorrent-linux-${_platform}" "${pkgdir}/usr/share/${_pkgname}"
  ln -s "/usr/share/${_pkgname}/WebTorrent" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "WebTorrent-linux-${_platform}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

