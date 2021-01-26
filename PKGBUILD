# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.11.2
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname" "${pkgname%-bin}")
depends=('gcc-libs' 'openssl')
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('fe80fbf063f15d9a37b3ff96182937b2da4440e2e97b42892bd264bba2be2b5521eeb5ac2c0fd117b602193b7ff63109061b8daa067220d433d9994e392cf06a'
                   '7048e168d49dbf238866fb7c1ce77152c8cb183761a0d05cc734c66a17989c5332b6340d00af0bbbe6fd05ff8f190effc68927e4279c9436a1bbefd580a8c7f4')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
