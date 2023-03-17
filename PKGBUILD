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
  'ceffca87c8624411701e16eccd8f81e54da72b16850f7ffa4019ba2959c5c06e6a4301a253aef7aee04e242f188a9f8fcfcb59373335800f2a8129c54c9142fa'
  '9f880ad5244fa0fe906be6d7c04ccdad83cbb69b0234a94e08b93783d69021b07078108256910e24e25fd2e2ce60cbdf042cd74267b98acc543492d69814aab0'
  )
md5sums=(
  'd4506d1998ee207f1bf7940ede4740a2'
  '384972f46d5836511418d711542d102f'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  install -Dm755 "$pkgname/usr/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname/usr/share/licenses/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -r "$pkgname/usr/share/$pkgname" "$pkgdir/usr/share/$pkgname"
}

