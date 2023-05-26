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
  '8b592036897cf50b0ab7686a36cc677bda9f6c647507ef65f3c26b75a636d5d2d65b379c62ecdd77ac404158ca4cef792175a336b1616b8b36b10218887ddd1c'
)
md5sums=(
  'f49996c8de72ab94ccf1940e150676d1'
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
