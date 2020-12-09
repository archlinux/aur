# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=sic-image-cli-bin
_pkgname=sic
pkgver=0.14.0
pkgrel=3
pkgdesc="Accessible image processing and conversion from the terminal"
arch=('x86_64')
url="https://github.com/foresterre/sic"
license=('MIT')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/$_pkgname-$pkgver+features.imageproc-ops-x86_64-unknown-linux-gnu.tar.xz"
               "$pkgname-$pkgver-LICENSE-MIT::$url/raw/v$pkgver/LICENSE-MIT"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md"
               "$url/releases/download/v$pkgver/shell_completions.zip")
sha512sums_x86_64=('7ee5d44d14cf0fd40cb04afa7a2196b2a3a0f8ae16375473828650c3b24c5bf9c499593b1495cf326c40289afc65413fcdb4e98c0ca23772043dce1586714a6c'
                   '011be214fb603bf19617e10c0a9006312aabac26c4148c0a544c0eb01a21259233da7a4a9512752150988ce5b78d90cb18b3b3eb0116e27b6b80c003b43e5a1d'
                   '94d715b5e2017e1e29e308ea84db1f98e4dc5261fa236ccf78a473d9e2232fa9538a55323fa26da6db5e378b3a41bf67d344f8e3119b843a64f8a8ec6c4e98e3'
                   'c3ce7c681c50a4bba8f29cca4f3269b857bd7f5f64b7b84c411fb41d4ff0ace6c06aae760bdcc81be0a750f271bac2cf80f6fc8376d5f3e293d915e2b37d3ecc')

package() {
  install -Dm 755 "$_pkgname" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm 644 "$_pkgname.bash" "${pkgdir}/usr/share/bash-completion/completions/$_pkgname"
  install -Dm 644 "$_pkgname.fish" -t "${pkgdir}/usr/share/fish/completions"
  install -Dm 644 "_$_pkgname" -t "${pkgdir}/usr/share/zsh/site-functions"
}
