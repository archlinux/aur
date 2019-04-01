# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=suricata-emerging-rules
pkgver=9154
pkgrel=1
pkgdesc="Suricata rules from emergingthreatspro.com"
arch=('any')
url="https://rules.emergingthreatspro.com/open/suricata/"
license=('custom')
optdepends=('suricata')
makedepends=('curl')
options=(!strip)
source=(
  "https://rules.emergingthreatspro.com/open/suricata/LICENSE"
  "https://rules.emergingthreatspro.com/open/suricata/emerging.rules.tar.gz"
)

pkgver() {
  curl https://rules.emergingthreatspro.com/open/suricata/version.txt
}

package() {
  mkdir -p "$pkgdir/etc/suricata/"
  cp -r "rules" "$pkgdir/etc/suricata/"
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('SKIP' 'SKIP')
