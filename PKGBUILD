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
  '76c8cfd1bbc06bf44f6fafbbbb888d81c1d2e6a36543853c761ac0d4d9108347168a4ab9e3b470e6f40271408a766a26db95a7f5337c4f72010d292f28c72ae6'
)
md5sums=(
  '94a1e982b2c67521a5bd3c41d8b776dd'
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
