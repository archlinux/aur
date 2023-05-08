# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=yt-mpv
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI YouTube client"
arch=('any')
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(mpv nodejs)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '7dcb1e1dc5d1aacf39adaf42e0a01cfde6c65307e18631adf2a5e76c5ac133c4328e4222295ef73c349c5947733af444fb35ad6645180b7939eecf6e428f2d0b'
  'd14c293de835369848df1925b8242863f962caeb6fd2301b08d22c21022df7943788db6894cce978f82d533fa8ce81cdfb327dc734c042eed225c0b71a416a13'
  )
md5sums=(
  '88b64dc9a2ea8d1223357514fe5b60f3'
  '788e19fbda7ee56b86648d9bea7c077c'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {

  [ -d "$srcdir/$pkgname" ] && cd "$srcdir/$pkgname" || cd "$srcdir"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/${pkgname}/* -t "${pkgdir}/usr/share/${pkgname}"

  cd "${pkgdir}/usr/share/${pkgname}"
  npx yarn install
  npx yarn link

}
