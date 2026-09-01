# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=warpscout-bin
pkgver=0.16.0
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
b2sums_aarch64=('0029b46f6a60b026559c5914209dee47641f5304ae01e6fbf499e2eac3d6372f8551ff2644d036a106911271dd9a8fdf6e18c98c1ff2ed6984638d63af5b9dfb')
b2sums_x86_64=('01fc8fdd6191474fe9a3a594a3a4785375a34e698da712988e4d61c8ee35c71e37277c7006da52e88fa4fea1c613a3868ab9ff140e605aa7441b54664d611e56')

package() {
  install -vDm 755 ${pkgname%-bin} -t "$pkgdir"/usr/bin/
  install -vDm 644 LICENSE         -t "$pkgdir"/usr/share/licenses/$pkgname/
}
