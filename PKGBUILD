# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=webtorrent-desktop-bin
_pkgname=webtorrent-desktop
pkgver=0.3.1
pkgrel=1
pkgdesc="Streaming torrent client."
arch=('x86_64')
url="https://webtorrent.io/desktop"
license=('MIT')
makedepends=('npm')
provides=('webtorrent-desktop')
conflicts=('webtorrent-desktop' 'webtorrent-desktop-git')
source=("https://github.com/feross/${_pkgname}/releases/download/v${pkgver}/WebTorrent-v${pkgver}-linux.zip")
sha256sums=('90a01cff9ac03c8766c9a1a9bd6d705216022d30054c0ba62230b6009bbaaf1c')

package() {
  install -dm755 "${pkgdir}/usr/share"
  install -dm755 "${pkgdir}/usr/bin"

  cp -a "WebTorrent-linux-x64" "${pkgdir}/usr/share/${_pkgname}"
  ln -s "/usr/share/${_pkgname}/WebTorrent" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "WebTorrent-linux-x64/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

