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
  '1c25e219321141afe135dac1fd8d5baafc553f3519e2003055ff1567991ec7fbd3c6ed625f4efe3a0b74a1e4aa452bf71880c21a9f07d1043fe85391c8cdc39b'
  '84a79d251760fb41ffeb5f39fcf08d750f2fde22767bcf3368ca5f707134751039f845207da6a5cd15d90e46fbf0fbcc86bad6d9246637e2a0d9ee611272bdee'
  )
md5sums=(
  'e311c28f84649841196f30595cc458bf'
  '9eb8f4c180bf9e4a5e4855d5a3100a4f'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
  cd "$srcdir/${pkgname}" 2>/dev/null || cd "$srcdir" 2>/dev/null
  install -Dm755 "usr/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "usr/share/licenses/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -r "usr/share/$pkgname" "$pkgdir/usr/share/$pkgname"
}

