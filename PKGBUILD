# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=warpscout-bin
pkgver=0.14.0
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
b2sums_aarch64=('b85e1a45a894b8153f32552f9468609187d71bb350e06a4ca35f5972f41407cee0ee8c0931cb62559548a45149c308148f24b49d17f03313d7a74de9ea331def')
b2sums_x86_64=('4eeb5203a9bcb1f2d4b530f0c4b252e5e98c12a643025ec3e6fdc178e7059a94601c304b7896a27c8ecc297e06dbb8be415d50b5dda2ba1ef3d35ed49ad4072f')

package() {
  install -vDm 755 ${pkgname%-bin} -t "$pkgdir"/usr/bin/
  install -vDm 644 LICENSE         -t "$pkgdir"/usr/share/licenses/$pkgname/
}
