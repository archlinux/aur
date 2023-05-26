# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=yt-cli
pkgver=0.2.2
pkgrel=1
pkgdesc="An easy to use CLI YouTube client"
arch=('any')
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(mpv npm)
install="yt-cli.install"
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.xz"
)
sha512sums=(
  'a12409e8a032c5cd9883e0edbb6e1c228672d484d0cf3d6d449feb11d749b4fd5d341c0e3ffca9ed133ef1ac5891bf62e7d2fee4d78f3908cf81aae4d8e2521a'
)
md5sums=(
  'c7ca7565f56b14a984e22e7fa92d3e54'
)
validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
)

package() {

  echo "${srcdir}/${pkgname}-${pkgver}-${pkgrel}-${arch}"
  [ -d "${srcdir}/${pkgname}-${pkgver}-${pkgrel}-${arch}" ] &&
    cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}-${arch}" ||
    cd "${srcdir}/${pkgname}"

  make install PKGDIR="${pkgdir}" || return 1


}
