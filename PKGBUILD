# Maintainer: Andrius Semionovas <aneworld at gmail dot com>

pkgname=shark-cli
pkgver=2.7
pkgrel=1
pkgdesc="The Shark Command Line Interface (CLI) enables you to analyze heaps directly from your computer"
arch=('any')
url="https://github.com/square/leakcanary"
license=('Apache')
depends=('java-runtime'
         'sh')
source=("https://github.com/square/leakcanary/releases/download/v${pkgver}/shark-cli-${pkgver}.zip"
        'shark-cli'
        'LICENSE.txt')
sha256sums=('6a4198deec2369f6b7e03e4a0175eb1cdba74b02989159f652b729016e140468'
            '00b3ca9477e2cbac354ab08cd1988c5d234570307808eff293e4f10728a5455b'
            '58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd')

package() {
  # Install jars
  install -d ${pkgdir}/usr/share/java/${pkgname}
  install -Dm644 ${srcdir}/shark-cli-${pkgver}/lib/* ${pkgdir}/usr/share/java/${pkgname}/

  # Install license
  install -Dm644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt

  # Install run script
  install -Dm755 ${srcdir}/shark-cli ${pkgdir}/usr/bin/shark-cli
}
