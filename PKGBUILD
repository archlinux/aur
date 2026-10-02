# Maintainer: Viktoras Agejevas <v.agejevas at gmail dot com>
pkgname=swayview-bin
_pkgname=swayview
pkgver=0.1.8
pkgrel=1
pkgdesc='Live workspace overview for sway (prebuilt binary)'
arch=('x86_64')
url='https://github.com/agejevasv/swayview'
license=('MIT')
depends=('glibc' 'libgcc' 'libxkbcommon' 'sway')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('2ac7f042793849f770251fc24acedb7b27834354fbe38c501c96768a46ff9a88')

package() {
  cd "$_pkgname-v$pkgver-x86_64-linux"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
