# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-binstall-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Binary installation for Rust projects"
arch=('x86_64')
url="https://github.com/ryankurte/cargo-binstall"
license=('GPL3')
depends=('zlib' 'openssl' 'xz' 'bzip2')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tgz::$url/releases/download/v$pkgver/${pkgname%-bin}-x86_64-unknown-linux-gnu.tgz"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('9d2eae5cb2d7ac089763c060da9e7565b6fe351df66d58f4b0b140167415f810941540e2437ccd60c5437a8ad720a2dc5f51459a6a736d1f2412828719023524'
                   '1d6de40c4f6edab5a82dbc3a48941ee9599b0e196312cb87f95ec6c37a98d9c99cf5be94a1c42d6e41c6e7ef954428d86ff832b8324cd996874efa5f11afa938')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
