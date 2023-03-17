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
  '19a19aee2474369a9a9bc6ffad2d3df4f99c98aecae2ff3b7860fd2bc57c8c953f3cafcbe86f90fc2f1bc115310819baa15ac9a3526d6668199f62cc5d271a39'
  '939415833b1e3d7c88d28f78b903549c85db1b19601f82b58485c7fff7da1fb80eda79e02522a51680848da7e227b4b922b93979eab2706a44cf25569c99c0ad'
  )
md5sums=(
  'af929939bbdd78c7fae6513c76e9d601'
  'e7876d8fed8e1660644918c1f3b40273'
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

