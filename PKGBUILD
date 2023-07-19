# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=termimage-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Display images in your terminal"
arch=('x86_64')
url="https://github.com/nabijaczleweli/termimage"
license=('MIT')
depends=('gcc-libs')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("https://debian.nabijaczleweli.xyz/pool/main/t/${pkgname%-bin}/${pkgname%-bin}_${pkgver}-1_amd64.deb"
               "${pkgname%-bin}-v$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE")
sha512sums_x86_64=('ced1024243a8d4ee00e989439ec155d47a2360197dd27d450cb45b16e317c1f0e6325fb7f13f9d8a1a2e06100cb9f06a290f5c0e2b003a3e2e6e7396b1d90324'
                   '25e0f2eb4d34813f14fabea8245680d734a50ff3be597146c47d4d6c819f61f4f8bb1c6ffa4f9047725aa6923d5db3043b7add60b5f428ab29de6932a70b8a24')

package() {
  tar -xaf data.tar.xz --directory "${pkgdir}"
  mv "$pkgdir/usr/share/doc/${pkgname%-bin}" "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "${pkgname%-bin}-v$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
