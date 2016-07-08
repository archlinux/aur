# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=suricata-emerging-rules
pkgver=8355
pkgrel=1
pkgdesc="Suricata rules from emergingthreatspro.com"
arch=('any')
url="https://rules.emergingthreatspro.com/open/suricata/"
license=('custom')
optdepends=('suricata')
options=(!strip)
source=(
  "https://rules.emergingthreatspro.com/open/suricata/LICENSE"
  "https://rules.emergingthreatspro.com/open/suricata/emerging.rules.tar.gz"
  "https://rules.emergingthreatspro.com/open/suricata/version.txt"
)

pkgver() {
  cat version.txt
}

package() {
  mkdir -p "$pkgdir/etc/suricata/"
  cp -r "rules" "$pkgdir/etc/suricata/"
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('6d3d08af2da41f6ff042fdd5ade4091a'
         'SKIP'
         'SKIP')
