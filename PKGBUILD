# Maintainer: Mansour Behabadi <mansour@oxplot.com>

pkgname=pdi-ce
pkgver=7.1.0.0_12
pkgrel=1

pkgdesc='Pentaho Data Integration (ETL) a.k.a Kettle'
arch=('i686' 'x86_64')
url='https://community.pentaho.com/projects/data-integration/'
license=('Apache')

depends=('java-runtime' 'gtk2' 'libxtst')

source=(
  "https://downloads.sourceforge.net/project/pentaho/Data%20Integration/$(echo $pkgver | grep -Po '^\d+\.\d+')/pdi-ce-${pkgver//_/-}.zip"
  "spoon"
  "carte"
  "kitchen"
  "spoon.desktop"
)
sha1sums=(
  'dcdbc0f7dc0bbcf745707277c09fb2aedccaa5ca'
  '9498b8259c90304721d302c615e81c3dd9b2cabc'
  '4680e39d10989a491d5d0cdacf12dcb7f1fda236'
  'cd5f84709d8e40c28d2340081073c508b89e1cc1'
  '99ff161080cfd675a11928dd467426ba72df4e77'
)

package() {
  install -d "$pkgdir/opt/pdi"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/icons"

  cp -r data-integration/* "$pkgdir/opt/pdi"
  install -m 755 spoon carte kitchen "$pkgdir/usr/bin"
  install -m 644 "spoon.desktop" "$pkgdir/usr/share/applications/spoon.desktop"
  install -m 644 data-integration/spoon.png "$pkgdir/usr/share/icons/spoon.png"
}
