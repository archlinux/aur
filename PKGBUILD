# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.13.3
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
sha512sums_x86_64=('1dbdbb4ede1b8a0cd680fc90fb15e693d5828200685046ebe8de7d1cc1b8c0d095648866856c9abd0ab665d7ba09caff3bdf6ea80a35eb7d7ceb4dc680ce3a91'
                   'f248c28bee2c60ac0987beb2d1d0ec8b79a78075d0e628d3a4ba815b90923dc30087e380b1cf23a12e797c124993bf1af22cf0177fda5be5acb1ba6e13eefcec'
                   '65d34ba04b98f3f7905252da2de301635fadabb0ac374bdef4684419629e9dc06742e21390aea4d8b1ea4614fa9e290200c6404489261de397ea630066f7613d')
sha512sums_aarch64=('1dbdbb4ede1b8a0cd680fc90fb15e693d5828200685046ebe8de7d1cc1b8c0d095648866856c9abd0ab665d7ba09caff3bdf6ea80a35eb7d7ceb4dc680ce3a91'
                    'f248c28bee2c60ac0987beb2d1d0ec8b79a78075d0e628d3a4ba815b90923dc30087e380b1cf23a12e797c124993bf1af22cf0177fda5be5acb1ba6e13eefcec'
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
