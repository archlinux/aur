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
  '9b3a8d09125a5b7469bd0e8331e6375d6163f19d8f08a713696c938a24d2604051aacf3a046e0ac4f1595634e6f6d293a2c3c0a7caac0cbeea368f01f02db0e0'
  '8f4bd1dbc0827de617c499d42780d92d5f87966b2bf13fba2e34a2fc89f9f0d34dc13fb6bb2144c11e03049ab1719071a9973fa76cd488058eeb19250b5bd571'
  )
md5sums=(
  '6209ec53ec7edddf63662a76bc687e65'
  'c902aa80b5967d17c9975922aff7aa2f'
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

