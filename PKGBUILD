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
  '0c21a30d9ded4614f7b3474e327f6d977e448c835aca239d40650efd21217fbb4cd9a8e80c1c0762007827f6483211c670c96e0d5a8de5c244884aecb564f06a'
  'bce6d9f4fc97f9bc00e1e07162e910fdf9d15c9f2329652acd9c1afd1bba7e2e4d6ff0e615bc0fad1fa314f06957be07c472b293125c2dcfc8d123c2d48f6a4c'
  )
md5sums=(
  '1cacc369802f1afbdc1f47f87975dca3'
  'fae83d9fe8a8d3f462ed338f5fd04667'
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

