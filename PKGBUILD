# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.13.1
pkgrel=2
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-linux-x64-musl"
               "$pkgname-$pkgver-completions.zip::$url/releases/download/v$pkgver/completions.zip"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('a4f82b0bacc3522f6f76ed3837cf7b97c45e9d318a456fdfbfdbd94c6be82099480e235db99ac2ff3ae418d5c831bccd16ddcebc2f19e99bb4ab8fab444a8b79'
                   '965ba3d26a1ec831e526641adcbcd43ba653b9521c15f1e64ad039f75d997fa87766139e0f14e620df22e0c2a58b890e64b94a85ec2ad2e6b9039a6181445bd4'
                   'a7c39dae7e73fc3e8aa52b10135967478543259efb8cb66dcacb783cb5976000d41b82bfe875a22a51c96027f4a7828ed2945fbefb6dc3a242ee65959295924f')
source_aarch64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-linux-arm64-musl"
               "$pkgname-$pkgver-completions.zip::$url/releases/download/v$pkgver/completions.zip"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_aarch64=('9b3cc95bc920468cb94c3eb6a80f1de4d2e43c9b7633ec8c4d33d11bd64784a2fcb4716b1367a41e18fffbd8f2b20821b6c913e858ace848aa18def6251c2bb8'
                    '965ba3d26a1ec831e526641adcbcd43ba653b9521c15f1e64ad039f75d997fa87766139e0f14e620df22e0c2a58b890e64b94a85ec2ad2e6b9039a6181445bd4'
                    'a7c39dae7e73fc3e8aa52b10135967478543259efb8cb66dcacb783cb5976000d41b82bfe875a22a51c96027f4a7828ed2945fbefb6dc3a242ee65959295924f')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "completions/$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm 644 "completions/$_pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm 644 "completions/_$_pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
}
