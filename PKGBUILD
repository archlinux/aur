# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=warpscout-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="Cloudflare WARP endpoint scanner"
arch=(aarch64 x86_64)
url="https://github.com/vernette/${pkgname%-bin}"
license=(MIT)
depends=(
  ca-certificates
  glibc
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
source=(${url/github.com/raw.githubusercontent.com/}/refs/heads/master/LICENSE)
source_aarch64=($url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz)
source_x86_64=($url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz)
b2sums=('b32b20b183f2fd9f97b7a7e94e9bb5bdb1d8ae8091dedf671bb3ea07c723986f19eb2c118b6ab463b082fe58edd477183b766ffe4fb8ebea1227daf102d658bb')
b2sums_aarch64=('79ddce3f1bc4cecf8708af65d931d91c5ee444d72f1aff0584652b5d067b07a04ad6a5283d6d54b2b40605572da9ab2ebf05793e694c20b5170fa122184b9564')
b2sums_x86_64=('6a3ceea6de3df640aa78d80fe5a5987acf18aefb2febde8c6b962061fb1d20055f80d4cdf5988b875900ee506a8b6beb4a4b51bb03e56dd3a9d6681440b73f27')

package() {
  install -vDm 755 ${pkgname%-bin} -t "$pkgdir"/usr/bin/
  install -vDm 644 LICENSE         -t "$pkgdir"/usr/share/licenses/$pkgname/
}
