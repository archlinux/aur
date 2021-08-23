# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.12.6
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('823feababcacbca56a53f241e1356d50bae02ea7c3e6136668eba0b21b4007a3231e250cb745d3f67e1cdf587141a344a3face5b35a8eaf1303f9d73d32ec186'
                   '17744f19aab63b3abf6080ce8e8fa1561dc85ec18a03a05d276f4e0eaf84bde0906b9a7a2d0893048458e6750af95b99c09a5fce8ae3fc27bce3a35b2de0688b')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
