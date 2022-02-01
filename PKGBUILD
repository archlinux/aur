# Maintainer: soloturn@gmail.com

pkgname=easytax2021bl
pkgver=1.0
pkgrel=1
pkgdesc="Aargau tax declaration software."
arch=(any)
url="https://www.baselland.ch/politik-und-behorden/direktionen/finanz-und-kirchendirektion/steuerverwaltung/privatperson/easytax"
license=('custom')
depends=("java-runtime>=8" "bash")
makedepends=("java-environment>=8")
source=(
  "https://msg-easytax.ch/bl/2021/EasyTax2021BL_unix_1_0.tar.gz"
  "$pkgname.desktop"
  "$pkgname.run"
)
sha256sums=(
  '4eaab0c3df239a5deb0ef16ccfc1363976b9bb7f77cd02b9618979b904fe9d90'
  'dc0bf55a93ca40169b0018b5df6b1917f04d70afccb221581892a5eed94ac603'
  '046859e2f9e65c3f93cc021e7bbd6426345b11ee5759dd75c125cee68607a63f'
)

prepare(){
  cd "$srcdir"/EasyTax2021BL/
}

build() {
  cd "$srcdir"/EasyTax2021BL/
}

package() {
  depends+=("java-runtime")
  install -m 755 -D "$pkgname.run" "$pkgdir"/usr/bin/$pkgname


  mkdir -p "$pkgdir"/usr/{lib,share/applications}
  mv "$srcdir"/EasyTax2021BL/ "$pkgdir"/usr/lib/$pkgname/
  cp *.desktop "$pkgdir"/usr/share/applications/
}
