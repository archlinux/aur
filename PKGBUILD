# Maintainer: David Pugnasse <david.pugnasse@gmail.com>
pkgname=pmd
pkgver=5.1.2
pkgrel=1
pkgdesc="A java source code scanner for detecting possible bugs, dead code, overcomplicated expressions and more"
arch=('any')
url="http://pmd.sourceforge.net/"
license=('custom:BSD-style')
depends=('java-environment')
source=(http://sourceforge.net/projects/pmd/files/pmd/${pkgver}/pmd-bin-${pkgver}.zip
bgastviewer cpd cpdgui pmd pmd-designer pmd-run)
md5sums=('5cdd25c7d2eb0c3083ef353e58a94aea'
         'bb127d9c841bdae7c89a52c5a94e06cc'
         '249cc68dbab0b512d7bf36255ca29c65'
         '972d2ca7bfb874c26b7c17a4c3dad70c'
         '94198cb540d22e06ef123c38d6672303'
         '0fe4e9103ea1ad6ad4d01c484a5fb294'
         'a4cc2f616906fd617bf99fe784f2152f')

build() {
  install -dm755 ${pkgdir}/usr/share/{java,licenses}/${pkgname}
  install -m644 $srcdir/${pkgname}-bin-${pkgver}/docs/license.html ${pkgdir}/usr/share/licenses/${pkgname}/license.html
  install -m644 $srcdir/${pkgname}-bin-${pkgver}/lib/*.jar -t ${pkgdir}/usr/share/java/${pkgname}

  install -Dm755 bgastviewer ${pkgdir}/usr/bin/bgastviewer
  install -Dm755 cpd ${pkgdir}/usr/bin/cpd
  install -Dm755 cpdgui ${pkgdir}/usr/bin/cpdgui
  install -Dm755 pmd ${pkgdir}/usr/bin/pmd
  install -Dm755 pmd-designer ${pkgdir}/usr/bin/pmd-designer
  install -Dm755 pmd-run ${pkgdir}/usr/bin/pmd-run
}

# vim:set ts=2 sw=2 et:
