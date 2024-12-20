# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=12.7.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')
optdepends=('xdg-utils')
_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('af5be3298a6c9da3a7c4e8340d9fa0001083c4d64a15c83351ed84a38035f81eb48a79fb26f98f5ab3df5ec7a34706fd05837d3d9e6c8c55ad81598719227ebd')
[ "$CARCH" = "x86_64" ] && sha512sums=('290cc11ed4cd60634227d896062a32add142d835a3566d7ee7b0f2356ae58f3dbc203f6d6cba9fc433180082ed9a8fb1d905a11206902947da59973630a2031f')

prepare() {
    tar -xf data.tar.xz
}
package() {
    cp -dr --no-preserve=ownership opt usr  "$pkgdir"/
}
