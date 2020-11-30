# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.10.3
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('34554e1d8a09f67a6e1c66e1ba6821aff515b2708e56ab51eeac985126c1d5c828cbf800ca18656b535587fcc7d2e52560b5e9efddee5ba3e53f317559704660'
                   '126d491778770535e5bd7194939a05bf626818ce92dbfa04824198f4e1c0aef14cadab9e72bbedb3db8a709131dc181a42ce4362d3fbcef2841300a335b48b44')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
