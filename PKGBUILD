# Maintainer: Alexander Rowsell <amrowsell followed by frozenelectronics dot tld for canada>
pkgname=ueforth-bin
_pkgname=ueforth
pkgver=7.0.6.19
pkgrel=1
pkgdesc="An EForth inspired version of Forth bootstrapped from a minimalist C kernel"
arch=('x86_64')
url="https://eforth.appspot.com/linux.html"
license=('Apache')
provides=('ueforth')
conflicts=('ueforth-git')
source=("https://eforth.storage.googleapis.com/releases/$_pkgname-$pkgver.linux")
depends=('gcc-libs' 'glibc')
sha256sums=('67ff0591d1bc6086ddb07411e1b9a6f65f67a0c0b42ff77efed27e0eef4a03e4')
noextract=('$pkgname-$pkgver.linux')

prepare() {
  cd "$srcdir"
  mv "$_pkgname-$pkgver.linux" "$_pkgname"
}  

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin/"
  install -m755 "$_pkgname" "$pkgdir/usr/bin/"
}