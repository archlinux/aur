# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gfold-bin
pkgver=0.7.1
pkgrel=2
pkgdesc="CLI tool to help keep track of Git repositories"
arch=('x86_64')
url="https://github.com/nickgerace/gfold"
license=('Apache')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/$pkgver/${pkgname%-bin}-linux-gnu-amd64"
               "$pkgname-$pkgver-README.md::$url/raw/$pkgver/README.md")
sha512sums_x86_64=('78526cc61d2ac724b0e49fe9f536488976e84e5237350896c00dc00a9e988394deb6ec2004acdf2628c8da7fcb4f3211ffd22ebf8115aa7417c393e224382ace'
                   'c7c983bf23d680b04a0a8ef58c8f898f5b8d6ebfa4d6d46f0578cf929f91df253b147c7c00ea1dce00ab91ae73dd4a5ebfafcb3da0a30134691ce98e5b7b0077')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
