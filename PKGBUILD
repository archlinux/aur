# Maintainer: Mansour Behabadi <mansour@oxplot.com>

pkgname=pdi-ce
pkgver=8.1.0.0_365
pkgrel=1

pkgdesc='Pentaho Data Integration (ETL) a.k.a Kettle'
arch=('x86_64')
url='https://community.pentaho.com/projects/data-integration/'
license=('Apache')

depends=('java-runtime' 'gtk2' 'libxtst' 'webkitgtk2')

source=(
  "https://downloads.sourceforge.net/project/pentaho/Pentaho%20$(echo $pkgver | grep -Po '^\d+\.\d+')/client-tools/pdi-ce-${pkgver//_/-}.zip"
  "spoon"
  "carte"
  "kitchen"
  "pan"
  "spoon.desktop"
)
sha1sums=(
  '8f796149b60621926b8083a46ce320e0fbd2009a'
  'b4166cbcb4fe8c77a4fc4ac02b08703aeacb9759'
  'cff3ac6b1df50792b41e613d39bcc3a04eea2e18'
  '0e06b24ffdfad8af2f321ad855d819d5cf4b085c'
  '1d1a0b6f5ef9a9a48280fb8c98d8feea0d62df4a'
  '99ff161080cfd675a11928dd467426ba72df4e77'
)

package() {
  install -d "$pkgdir/opt/pdi"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/icons"

  cp -r data-integration/* "$pkgdir/opt/pdi"
  install -m 755 spoon carte kitchen pan "$pkgdir/usr/bin"
  install -m 644 "spoon.desktop" "$pkgdir/usr/share/applications/spoon.desktop"
  install -m 644 data-integration/spoon.png "$pkgdir/usr/share/icons/spoon.png"
}
