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
  'c33de4986316a009a929fa3871d54d9018bca2219cbaafcd6f35bb35b4b09e17e786db161a4af9d4759b5169f825e4534b427f11e259d9a623270cd28c4ed2c0'
  'c37943aa5b8feb01b28383057f06f9ae35d2cba23fefaab6d4be4b4d6a19164d7554c66eeedf6856ed40bd59ba7ba258017266d012d2a46d7b775bd9dfc4174d'
  )
md5sums=(
  'f00a8696ea6543a502952da0c1c98bed'
  '86cd3fe5561f6ee36689f79e8ec32fc8'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {

  cd "$srcdir/$pkgname"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/${pkgname}/* -t "${pkgdir}/usr/share/${pkgname}"

  cd "${pkgdir}/usr/share/${pkgname}"
  npx yarn install
  npx yarn link

}
