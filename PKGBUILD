# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=byedpi-bin
pkgver=0.14.1
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
b2sums=('63b1b2d974e9f26dd0cb67ad86c9eb28611444d1db2dc1ce80bb21e8a57a71a2a9d247e3f217ae2ffad9af6f45a9f37f4e7eb57795d28e7cc00c8abe7a464349'
        'f3340917f897d376466c5d3e4c4d6d4e29d929da2f44626e779a80a989a9376082388c941197fc16c78e848e7ee7e38f1a22ffbda5f7cdc6eee5556b4d16bc72'
        'dd51700e972d759a2297bddc15455477a9574b98174e48c6c89236999fb028c09b8eff8a67067bc49e1a8830e43c7a6d76c4c5c644716562818b02320463e1aa')
b2sums_aarch64=('438626ba039a13d3927a361a44175f969e5764b3985ab89a10d5b24e1b4e88e2b28c37bd0d1414a768e8f3351a54938332a8c4b7619acf7cf8b74fc0be972bc4')
b2sums_armv6h=('079e6ddf5f3c18a97db9920d028a025480ec6a88b2038d82ae6c53d9bbe19534ef14cd59a5ab252059ee6b6635ce86fda1858de5274a97d7dbdab422f0f3acb6')
b2sums_armv7h=('18b6259d33a99c4037ce96513c728aff293856c64c0fc27c7e84fe5fe4061aa7c5b0bcb3e15993d4afc8c25a71b7457857a0c698908077bb4a27a12a5b7ff9ec')
b2sums_x86_64=('8481b30a025b8ae884e7933f214f44c67c11ececc0c970072b8f9183ddbb5c3745a39fa181daae2fd9aa2044577ba62e7188fe0df0224825b47ff1ff6b198f47')

package() {
  install -vDm644 ${pkgname%-bin}.conf    -t "$pkgdir"/etc/
  install -vDm755 ciadpi-*                   "$pkgdir"/usr/bin/ciadpi
  install -vDm644 ${pkgname%-bin}.service -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm644 LICENSE                 -t "$pkgdir"/usr/share/licenses/$pkgname/
}
