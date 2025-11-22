# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.13.4
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-linux-x64-musl"
               "$pkgname-$pkgver-completions.zip::$url/releases/download/v$pkgver/completions.zip"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('54e549891b2255edf30a8cd67e7b2e0638009e2feb415815808e5d7f1c32eef7e57d1b2a9c32e37049658db2b73d527f16352defeee16ec4a00d000fbd8780ea'
                   '865ef87ae1925eaa8750526c4925719a17ed636ee4e8ec54b3ff00d81652a5b04a290056c96a66d2ab3c4a3f4a98ec6840d60fd329565400aff28c35ad0cb346'
                   '65d34ba04b98f3f7905252da2de301635fadabb0ac374bdef4684419629e9dc06742e21390aea4d8b1ea4614fa9e290200c6404489261de397ea630066f7613d')
sha512sums_aarch64=('54e549891b2255edf30a8cd67e7b2e0638009e2feb415815808e5d7f1c32eef7e57d1b2a9c32e37049658db2b73d527f16352defeee16ec4a00d000fbd8780ea'
                    '865ef87ae1925eaa8750526c4925719a17ed636ee4e8ec54b3ff00d81652a5b04a290056c96a66d2ab3c4a3f4a98ec6840d60fd329565400aff28c35ad0cb346'
                    '65d34ba04b98f3f7905252da2de301635fadabb0ac374bdef4684419629e9dc06742e21390aea4d8b1ea4614fa9e290200c6404489261de397ea630066f7613d')
source_aarch64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-linux-arm64-musl"
               "$pkgname-$pkgver-completions.zip::$url/releases/download/v$pkgver/completions.zip"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "completions/$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm 644 "completions/$_pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm 644 "completions/_$_pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
}
