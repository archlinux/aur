# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.13.0
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
               "$pkgname-$pkgver-completions.zip::$url/releases/download/v$pkgver/completions.zip"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('d5f071c934d3dbe5a6df2a7b25783d496ca8ab8d1361f3c840e3bd40c9b5d490f12ccf3da7cadb005eaec996ac0ce26c61783d04230a10d14854879470dc7933'
                   'c7f915c5bacc6115c8357239686960b6e241d9f34c67d8e141f24eeaaf9b8e2f6bea144e92dc330d4381134cc95992feddabb956b7ffbec91d247b477fa48389'
                   'a7c39dae7e73fc3e8aa52b10135967478543259efb8cb66dcacb783cb5976000d41b82bfe875a22a51c96027f4a7828ed2945fbefb6dc3a242ee65959295924f')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "completions/$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm 644 "completions/$_pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm 644 "completions/_$_pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
}
