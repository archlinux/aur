# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=web2desk
pkgver=0.1.0
pkgrel=1
pkgdesc="A means of creating desktop applications from websites/webapps"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=()
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '391e5adc0c8ba5d20eac273d256f0a8342749693c8492c003b334b4060f1b02b7e24b26b1d2c49dfb5c3e0df882e32de67b172b0c5167f7cb0fa26424e7b012b'
  'ef8049a63e233df4f4596d24c62635361df43c02f7eb780412b3f3c1e1f89c3ecd0dbb24ba2100c17f44f4308537531306d39c130ddff94fc4ef25c58f38377c'
  )
md5sums=(
  'f0353a29567b2355b736762717bd0172'
  '5dd47e384ec3c65418aaaec0fbb48111'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  install -Dm755 "usr/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "usr/share/licenses/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -r "usr/share/$pkgname" "$pkgdir/usr/share/$pkgname"
}

