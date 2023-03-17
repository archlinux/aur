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
  '1873c1c9df70003e57bfd595afc6975c84acdb6af60fb513927f2014730176c9f5d5d5bba5bba9e32e9fa1f8ab4dbb0e49d0fa79cb057e80e179e6697f048813'
  '5ca7050ce792e70f6ff3310300326d56c8fc7294a876491978484b973079abc0f6d788410f6207f0c9ad69b5050e9fcee97f7032dfd2d37b1a52154c9fca87dd'
  )
md5sums=(
  '8399535c0766e53af502df0e6085a7ee'
  'f5cce50f53627e970cdcf2e34325d472'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
  cd "$srcdir/${pkgname}" 2>/dev/null || cd "$srcdir" 2>/dev/null
  install -Dm755 "usr/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "usr/share/licenses/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -r "usr/share/$pkgname" "$pkgdir/usr/share/$pkgname"
}

