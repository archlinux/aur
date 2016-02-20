# Maintainer: Mike Lenzen <lenzenmi@gmail.com>
pkgname=otf-fanwood-git
pkgver=r1.cbaaed9
pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=2
pkgdesc="A serif based on the work of a famous Czech-American type designer of yesteryear."
url='https://github.com/theleagueof/fanwood'
arch=(any)
depends=(fontconfig xorg-font-utils)
source=("$pkgname::git://github.com/theleagueof/fanwood")
install=$pkgname.install
license=('custom:"OFL"')
md5sums=('SKIP')

package() {
#FONT
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 "$srcdir/$pkgname/"*.otf "$pkgdir/usr/share/fonts/OTF/"
#LICENSE
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "$srcdir/$pkgname/Open Font License.markdown" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
