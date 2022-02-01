# Maintainer: soloturn@gmail.com

pkgname=easytax2021ag
pkgver=1.0
pkgrel=1
pkgdesc="Aargau tax declaration software."
arch=(any)
url="https://www.ag.ch/de/dfr/steuern/natuerliche_personen/steuererklaerung__easytax/steuererklaerung_easytax1.jsp"
license=('GPL')
depends=("java-runtime>=8" "bash")
makedepends=("java-environment>=8")
source=(
  "https://msg-easytax.ch/ag/2021/EasyTax2021AG_unix_1_0.tar.gz"
  "$pkgname.desktop"
  "$pkgname.run"
)
sha256sums=(
  '531c03131b5a9ecf500fee3fbbf03e215d5ac02db6e5bcae72016838d09f17d8'
  '226fe09193348033b5f9b3311a4f7e12e2f20d4cfb56382371d834336fe4fbf0'
  '12f745749bc993e374f947a86f6c2651a4241de8b0aa22c52e139f8c429a1c0b'
)

prepare(){
  cd "$srcdir"/EasyTax2021AG/
}

build() {
  cd "$srcdir"/EasyTax2021AG/
}

package() {
  depends+=("java-runtime")
  install -m 755 -D "$pkgname.run" "$pkgdir"/usr/bin/$pkgname


  mkdir -p "$pkgdir"/usr/{lib,share/applications}/
  mv "$srcdir"/EasyTax2021AG/ "$pkgdir"/usr/lib/$pkgname/
  cp *.desktop "$pkgdir"/usr/share/applications/
}
