# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=warpscout-bin
pkgver=0.17.0
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
b2sums_aarch64=('cacfc938e29b25208d0583894968883d16bf062c869cf94b92174d5bf7b59629b986a9fe19206021046a243e2c3043650589d3124be33f1d99715e2d5fbaf410')
b2sums_x86_64=('eae8d01c84b0e93c46b68f38c9f0666afa1b9e355cf7f52bf5624102549613ee7e9a85fead679c4e285d15ea250ab3c7a0ee1262d4330b4d688459239f9c2788')

package() {
  install -vDm 755 ${pkgname%-bin} -t "$pkgdir"/usr/bin/
  install -vDm 644 LICENSE         -t "$pkgdir"/usr/share/licenses/$pkgname/
}
