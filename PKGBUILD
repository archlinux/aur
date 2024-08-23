# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=byedpi-bin
pkgver=0.13
pkgrel=1
pkgdesc="A simple and fast software designed to bypass Deep Packet Inspection"
arch=(aarch64 armv6h armv7h x86_64)
url="https://github.com/hufrea/${pkgname%-bin}"
license=(MIT)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
backup=(etc/${pkgname%-bin}.conf)
source=(
  ${pkgname%-bin}.{conf,service}
  $url/raw/main/LICENSE
)
source_aarch64=($url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-aarch64.tar.gz)
source_armv6h=( $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-armv6.tar.gz)
source_armv7h=( $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-armv7l.tar.gz)
source_x86_64=( $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-x86_64.tar.gz)
b2sums=('48efdd4c15bfab7b259717f2858ea774c037ce2e07f9535ffdc6ad9c267e04585644b37980e288354c368681ed43e0f2b7b57c8a5525886949054c2a5740da6f'
        '077b924cab222514033f2930593e071acb8aa0c4ceb3fda051e8fa0c557796b3a7cdd2013ff057ad42b5f5fe738362ff36f458d425fc7a78af07767c89cdc16c'
        'dd51700e972d759a2297bddc15455477a9574b98174e48c6c89236999fb028c09b8eff8a67067bc49e1a8830e43c7a6d76c4c5c644716562818b02320463e1aa')
b2sums_aarch64=('e74f4076de9fa44562cd03d4ee6f7d3cf8905631e032e32464cc972686632cb767292e42bf3d44f8bc1f0385db99b16883dd8f25b301343c9d49954a0cb19819')
b2sums_armv6h=('5b647550a30fb5b9f6afb20a14a04078a2add8dee6094c21b41f0fe3983cf32c71c836573d4cb52a7890d2c8031f5b9e8d12c6fd270eeec5040a9b851f377a1c')
b2sums_armv7h=('c584cffb430c8c3a24ca930ee37e4ee77171cc8c7063d876aaccd79e30a63586479248b5a3133d6593440c1d99e90ba6333dd2aac8fbaf6164b578aa7072f506')
b2sums_x86_64=('de1657b99ec69370d1d9740d5135e197cca274e6b56ca0699c3fbdb42858a5a0e0995a5bb0d00bff28049768ef9d34016b954563b080787b8e357ebedc31dae1')

package() {
  install -vDm644 ${pkgname%-bin}.conf    -t "$pkgdir"/etc/
  install -vDm755 ciadpi-*                   "$pkgdir"/usr/bin/ciadpi
  install -vDm644 ${pkgname%-bin}.service -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm644 LICENSE                 -t "$pkgdir"/usr/share/licenses/$pkgname/
}
