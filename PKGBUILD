# Maintainer: flaviofearn <flavioislima@gmail.com>

pkgname=hyperplay
_pkgver=v0.0.5
pkgver=${_pkgver#v}
pkgrel=3
pkgdesc="An open source Web3 gaming platform."
arch=('x86_64')
url="https://github.com/HyperPlay-Gaming/hyperplay-desktop-client"
license=('GPL3')
conflicts=(${pkgname%-*}-{appimage,electron})
depends=('fuse2' 'gawk')
_filename=hyperplay-${pkgver}.pacman
source=("$url/releases/download/${_pkgver}/${_filename}")
noextract=("${_filename}")
md5sums=('2c359fbe20980f3dfbfd5bc235233ed6')
options=(!strip)

package() {
  tar -xJv -C "${pkgdir}" -f "${srcdir}/${_filename}" usr opt
  mkdir "$pkgdir/usr/bin"
  ln -s "/opt/HyperPlay/hyperplay" "$pkgdir/usr/bin/hyperplay"
}

# vim:set ts=2 sw=2 et: syntax=sh
