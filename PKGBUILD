# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=byedpi-bin
pkgver=0.12
pkgrel=6
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
b2sums_aarch64=('907fb75f971cb43e6d10144c573fff3ac986f0a01c517f13b9ebc93177ee11a6cd97d570dccb7941f32e56ab3f6c970da9d1a29da9d19dc8cdefd341e0ab8a5e')
b2sums_armv6h=('d02f27a50e068c8fa2f1fe6153814c3767714bf7ff9e002390e6f601f60e9987335e71ef554709bbb5949fab7885d0dd81342eee28d09e1d8b1020bdfc38e0f5')
b2sums_armv7h=('703bdb6c3cfee65ba78ed1e2c453c8d85b1bd80ff187bc5f585c049e2aa30a280c02639a95654430422308d0972f67719a275ceb14fb7b6f47b1d08b01e3cdb1')
b2sums_x86_64=('68a1386fad473b10e253f3b3b774201feaf2b124c1571b0a0102df2a3d1194a353ac02a1e0dbb2cbd4e312899b0ae08c07176b269f068eb2800bc53994396b3c')

package() {
  install -vDm644 ${pkgname%-bin}.conf    -t "$pkgdir"/etc/
  install -vDm755 ciadpi-*                   "$pkgdir"/usr/bin/ciadpi
  install -vDm644 ${pkgname%-bin}.service -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm644 LICENSE                 -t "$pkgdir"/usr/share/licenses/$pkgname/
}
