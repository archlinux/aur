# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=byedpi-bin
pkgver=0.13.1
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
b2sums_aarch64=('a5141a4f5864f8cd3ea230caff018356c05a72e71d8c85b507f367352352bf5166d4b9aa143cfc43dac8378d64ad3939e04ab56cc49cabb8f1afd43d370c02fe')
b2sums_armv6h=('a883df1a39ef903a7c3c3c586a08bd5ebaf7cbb4e2e649e95a9e6593dbf1f59e725821f2582df503efd652c474265ccb65930cc84a48820d369490e55918e30b')
b2sums_armv7h=('714816ec0ead203fb335c735063d20a5babd52ad3f903b57b5f1a5e766405b9f42c8a19223c4904197fa7d683bd7ef6359f09c10861bfa774dd15e729025522e')
b2sums_x86_64=('45e9fef76d75103c52739fe5385e1545d88886c947b1b78963d20009fc4fa1e5bdd71de89134250e3319aaeb1998d95fbd23992b8c69bf09123d35fe9e4e1211')

package() {
  install -vDm644 ${pkgname%-bin}.conf    -t "$pkgdir"/etc/
  install -vDm755 ciadpi-*                   "$pkgdir"/usr/bin/ciadpi
  install -vDm644 ${pkgname%-bin}.service -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm644 LICENSE                 -t "$pkgdir"/usr/share/licenses/$pkgname/
}
