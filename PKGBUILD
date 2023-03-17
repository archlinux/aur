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
  '1b3b0b7219b69d771110b3dc0743074eafd5b95b808f5bafa6ebc57a4ad3b0afca5866eaf447410cac1464ac84e884d72dc43dae5e6edc0c820baee75383215d'
  '775fc0a3f85dbac7ff3dcc0dd5a035e357f5f775e13cfd21d1e475f3de37147f077786bf019228b40ee59dfa6866dad03c6e56e6d34e2fdba15477ab414751d4'
  )
md5sums=(
  '691332349dae6e0f64114b4bf6322cd8'
  '722818ad52dfbee28fff56374ef72f8d'
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

