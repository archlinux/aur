# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.13.2
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
sha512sums_x86_64=('4fbd261596a4b1dc6ec4bee4c81ab216cfb0fb39aeb71a94348a675bce7598aea0cdabab84031f0b5f1cff155c68a27b9aae759d5462d5056ae2529160444257'
                   '7094e4fd37104c416155310e6a6ff76a0af754a94e215b50dff961602366c12d831d3dee137016097239b7be70243ddd84fb298e961c81c511b4e63193fbfae0'
                   '65d34ba04b98f3f7905252da2de301635fadabb0ac374bdef4684419629e9dc06742e21390aea4d8b1ea4614fa9e290200c6404489261de397ea630066f7613d')
sha512sums_aarch64=('4fbd261596a4b1dc6ec4bee4c81ab216cfb0fb39aeb71a94348a675bce7598aea0cdabab84031f0b5f1cff155c68a27b9aae759d5462d5056ae2529160444257'
                    '7094e4fd37104c416155310e6a6ff76a0af754a94e215b50dff961602366c12d831d3dee137016097239b7be70243ddd84fb298e961c81c511b4e63193fbfae0'
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
