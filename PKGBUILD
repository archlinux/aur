# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.12.12
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('b8d06984ee274e2652fde02c8edce5c75d40b419aa95fae4dca7a7f2d18e859f7bb842dc37b309cc5ab86c288089206b791609c371b3018d1b77beb597517424'
                   'ca971796d4cbaee97a1f4850bbb436d214a9848ac948f93ce79d9360f4c092d57a777528fde986763db44b6ff0a27a7c89fcc7e61df5178c611b8cb28f12cf2c')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
