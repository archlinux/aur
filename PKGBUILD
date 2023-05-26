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
  'bfad8891f555da4d521fa142409593acf69be4b37b8832c0dbb0f4808d152881e599cd3c2b9831c9040f7bb43a25370901f6157273921fa0738212660d721190'
)
md5sums=(
  '5445de2605d275ab55d55067c039baf5'
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
