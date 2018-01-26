# Maintainer: robertfoster
# Contributor: Ricardo Funke <ricardo [at] gmail [dot] com>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
# Contributor: Iwan Timmer <irtimmer [at] gmail [dot] com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Ricardo Band <me [at] xengi [dot] de>
# Contributor: Axilleas Pipinellis (aka axil42) <axilleas [at] archlinux [dot] info>
# Contributor: UshakovVasilii <UshakovVasilii [at] yahoo [dot] com>
# Contributor: Giulio Fidente <gfidente [at] gmail [dot] com>

pkgname=porntime-bin
pkgver=0.3.8
pkgrel=4
pkgdesc="Stream porn movies from torrents. Skip the downloads. Launch, click, watch."
arch=('x86_64' 'i686')
url="http://porntime.ws/"
license=('GPL3')
depends=('ttf-liberation' 'gconf' 'nss' 'libxtst' 'gtk2' 'alsa-lib')
optdepends=('net-tools: necessary for the new vpn feature')
provides=('porntime')
conflicts=('porntime')
options=('!strip')
install="porntime.install"

source_i686=("http://porntime.ws/PornTimeX32.tar.gz")
source_x86_64=("http://porntime.ws/PornTimeX64.tar.gz")
source=("icon.png"
        "porntime.install"
        "porntime.desktop")

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/opt/${pkgname}/"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share"

  # Program
  echo "${pkgdir}/opt/${pkgname}/"
  install -Dm755 ${srcdir}/PornTime		"${pkgdir}/opt/${pkgname}/"
  install -Dm644 ${srcdir}/nw.pak		"${pkgdir}/opt/${pkgname}/"
  install -Dm644 ${srcdir}/libffmpegsumo.so	"${pkgdir}/opt/${pkgname}/"

  # Link to program
  ln -s "/opt/${pkgname}/PornTime" "${pkgdir}/usr/bin/porntime"

  # Desktop file
  install -Dm644 "${srcdir}/porntime.desktop" "${pkgdir}/usr/share/applications/porntime.desktop"

  # Icon
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/porntime.png"
}

md5sums=('69d7b9c45f83c399b1c68e85c2921a9a'
         'eda173affdfd1630ff6a0bfa566bc1de'
         '886a43e17c69dd434b2bbb243fefee75')
md5sums_x86_64=('3f67821d7bfc80bd8bb858bc92f5425b')
md5sums_i686=('7dc74d8e04b62925a54c14b29d8b1f3d')
