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
  'c9f6690c136d5324317cbc96d05692632223817fcb5240c39093a520552012884d5cb79d47112f9b7b6e54eb453784d9808a55b01764bf5b9e94fb701f136e10'
)
md5sums=(
  'aa95a53e363c738bda44bc3160d8f362'
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
