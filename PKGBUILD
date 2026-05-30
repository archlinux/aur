# Maintainer: btjawa <btjawa@users.noreply.github.com>

pkgname=bilitools-bin
_pkgname=bilitools
pkgver=1.4.7
pkgrel=1
pkgdesc="A cross-platform bilibili toolbox"
arch=('x86_64' 'aarch64')
url="https://github.com/btjawa/BiliTools"
license=('GPL-3.0-or-later')
depends=('gtk3' 'webkit2gtk-4.1')
options=('!debug')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}_${pkgver}_arm64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
sha256sums_x86_64=('de521bf923844302622da54080de21c08a168aa911bf60fb0231a3d020e41457')
sha256sums_aarch64=('b880e162c8a678543fb3f70136742f729ad55216d7d641033ed74c22561a332c')

package() {
  local deb
  case "$CARCH" in
    x86_64)
      deb="${_pkgname}_${pkgver}_amd64.deb"
      ;;
    aarch64)
      deb="${_pkgname}_${pkgver}_arm64.deb"
      ;;
  esac

  bsdtar -xOf "$deb" data.tar.gz | bsdtar -xzf - -C "$pkgdir"
}
