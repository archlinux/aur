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
  'fd1f9c8bb6aa5ba341de55c0257735d56169d7c9900a89e3aad98ddb639aa0006d552929b6491f71efbd2bb92259b8b091203ed23cb01f6cd57364dd6ce3d1ac'
  '3e641c0efe2a866c48d88674560b88a1a7e19a53176a8f63a66a478949d015df5a2e817c58634eac38907aeba6033371de030136517ac096f664c1e2edd80952'
  )
md5sums=(
  '46d45c507f2e2d3e7296a93c2906427c'
  '38aacee1b601754aa242dd67651625b3'
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

