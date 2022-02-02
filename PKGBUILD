# Maintainer: Jeremy Stucki <dev@jeremystucki.ch>
# Maintainer: Daniel Wilhelm <concat(shield, wed) @ outlook.com>
# Maintainer: soloturn@gmail.com

yyyy=2021
pkgname=easytax${yyyy}ag
pkgver=1.0
pkgrel=1
pkgdesc="Aargau tax declaration software."
arch=(any)
url="https://www.ag.ch/de/dfr/steuern/natuerliche_personen/steuererklaerung__easytax/steuererklaerung_easytax1.jsp"
license=('custom')
depends=("java-runtime>=8" "bash")
makedepends=("java-environment>=8")
source=(
  "https://msg-easytax.ch/ag/${yyyy}/EasyTax${yyyy}AG_unix_1_0.tar.gz"
  "$pkgname.desktop"
)
sha256sums=(
  '531c03131b5a9ecf500fee3fbbf03e215d5ac02db6e5bcae72016838d09f17d8'
  '226fe09193348033b5f9b3311a4f7e12e2f20d4cfb56382371d834336fe4fbf0'
)

package() {
  # package the software, the xdg desktop file so GUI finds it
  # and the link in bin so commandline finds it.
  mkdir -p "$pkgdir"/usr/{bin,lib,share/applications}/

  mv "$srcdir"/EasyTax${yyyy}AG/ "$pkgdir"/usr/lib/$pkgname/
  cp *.desktop "$pkgdir"/usr/share/applications/
  ln -sf /usr/lib/${pkgname}/EasyTax* "$pkgdir"/usr/bin/$pkgname
}
