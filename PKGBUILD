# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.12.14
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('588a18b75abb4b492b2a56dd6563e846fac9212b578e3328e604ced7e64918b76f14ab66ad3fbdcc0702dfe917c4571dcfa70e2f09eb8b029da2ec862b6896e8'
                   '7efa3d7fa4164a41351949d2868cfa83fa20ea0e68c60d54fcdc8c24d1a04951bea2b007ded5b345e379794ffdd3c21ed77597f7f5fbfca9cb3d750e5bee3bae')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
