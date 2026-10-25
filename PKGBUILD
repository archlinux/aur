# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=warpscout-bin
pkgver=0.16.1
pkgrel=1
pkgdesc="Cloudflare WARP endpoint scanner"
arch=(aarch64 x86_64)
url="https://github.com/vernette/${pkgname%-bin}"
license=(MIT)
depends=(
  ca-certificates
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
source=(${url/github.com/raw.githubusercontent.com/}/refs/heads/master/LICENSE)
source_aarch64=($url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz)
source_x86_64=($url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz)
b2sums=('b32b20b183f2fd9f97b7a7e94e9bb5bdb1d8ae8091dedf671bb3ea07c723986f19eb2c118b6ab463b082fe58edd477183b766ffe4fb8ebea1227daf102d658bb')
b2sums_aarch64=('86402bde0de421605ff979210bddc0361968efa5b0bcc3e70ac67b23ed1df4d113598184004655fa2d12e4eff5d8f0fac9b4f434a5671cf6118d0c1a599085ea')
b2sums_x86_64=('00e2f19ebc8ca4f83fa95f450f023db3eecc23745d00f3d368e2265a74d6ffa63d50c4becc2b765769f2a699736b4a5dfe803a46ed1fe7577550b663c55bdd8a')

package() {
  install -vDm 755 ${pkgname%-bin} -t "$pkgdir"/usr/bin/
  install -vDm 644 LICENSE         -t "$pkgdir"/usr/share/licenses/$pkgname/
}
