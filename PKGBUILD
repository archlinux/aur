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
  '42eafdbab9dbe9c4383103d2710ffc42e589371471a10f9e0e449ed8dba56795fb28cd8ee7e00baa17d6a9a066cc9cb8b90b6905fbdd33aa6ca02d2e5be8a6eb'
  '2a786368cb61f238d2eb36c005b051a89e601be34083003fd113ca55880b6e9fd386e512d3b74754cf14c40658309fa034cd7a6b1e7b7913c0f84870795baa07'
  )
md5sums=(
  '76dc451d136a0a99cdf0e70823501abb'
  'b8876c506ab9283099cf3ad9a25b7cb7'
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

