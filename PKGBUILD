# Maintainer: soloturn@gmail.com

pkgname=easytax2021bl
pkgver=1.0
pkgrel=1
pkgdesc="Baselland tax declaration software, kanton basel-landschaft, 2021."
arch=(any)
url="https://www.baselland.ch/politik-und-behorden/direktionen/finanz-und-kirchendirektion/steuerverwaltung/privatperson/easytax"
license=('custom')
depends=("java-runtime>=8" "bash")
source=(
  "https://msg-easytax.ch/bl/2021/EasyTax2021BL_unix_1_0.tar.gz"
  "$pkgname.desktop"
)
sha256sums=(
  '4eaab0c3df239a5deb0ef16ccfc1363976b9bb7f77cd02b9618979b904fe9d90'
  'dc0bf55a93ca40169b0018b5df6b1917f04d70afccb221581892a5eed94ac603'
)

package() {
  mkdir -p "$pkgdir"/usr/{lib,share/applications}
  mv "$srcdir"/EasyTax2021BL/ "$pkgdir"/usr/lib/$pkgname/
  mv *.desktop "$pkgdir"/usr/share/applications/

  mkdir -p "$pkgdir"/usr/bin
  ln -sf /usr/lib/${pkgname}/EasyTax-Programm_2021_BL "$pkgdir"/usr/bin/$pkgname
}
