# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.12.13
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('18e5d4725bf362a12af1e4b6f62112301365cfd957d6f40c0ecb1d8558a24d8c2986d24a2a6933b3fb0092cb0bfc92048ad94f1211d43324e3b93022475835ce'
                   'e910e61c275038dd6c4bd747fa7e2baf096b6211646d8200fcddb42d149dae8b56b2f9c23cdb65a2bf0148b6068fe4c6853f429acc358ec821d7a104c8779452')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
