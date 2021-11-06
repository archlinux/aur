# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-binstall-bin
pkgver=0.4.1
pkgrel=2
pkgdesc="Binary installation for Rust projects"
arch=('x86_64')
url="https://github.com/ryankurte/cargo-binstall"
license=('GPL3')
depends=('zlib' 'openssl' 'xz' 'bzip2')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tgz::$url/releases/download/v$pkgver/${pkgname%-bin}-x86_64-unknown-linux-gnu.tgz"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('bd7ea694076c920935af3688977b6a37cbf28dae1500c7e1f532c99f1f6da7436b59a3117f6b3f8b85cbda89a9692cd50c9cebcc3d01819756dd6e8c80becb68'
                   'cb2379f3670630457ea7978a0db4a0a752ee20a2cac35e2d8848a5f3fb98153fbbf8ede8013bab9a4f463b1ebf8267a76dfb9b035abd0cc930604899f27117b3')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
