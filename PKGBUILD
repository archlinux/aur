# Maintainer: Alfonso² Peterssen <a2peterssen+aur ÅT gmail DÖT com>
pkgname=('jbang')
pkgver=0.99.1
pkgrel=1
pkgdesc="Unleash the (scripting) power of Java"
arch=('any')
url="https://www.jbang.dev"
license=('MIT')
depends=('bash'
         'java-environment>=8')
optdepends=('java-environment>=9: jshell support')
source=("https://github.com/jbangdev/jbang/releases/download/v${pkgver}/jbang-${pkgver}.tar"
        "https://raw.githubusercontent.com/jbangdev/jbang/v${pkgver}/LICENSE")
sha256sums=('e9f82a2799e4a0773d18232c7654b7e42daf5dec1f5e2dc520454dfb6669af56'
            '7c1797962764ae89b1774c44b7ad449e6eaaa83a8e4e4804d965978fe7231d9c')

package() {
  cd "jbang-${pkgver}"
  install -d "${pkgdir}/usr/share/jbang"

  cp -r bin "${pkgdir}/usr/share/jbang/"

  rm "${pkgdir}"/usr/share/jbang/bin/*.cmd "${pkgdir}"/usr/share/jbang/bin/*.ps1

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/jbang/bin/jbang" "${pkgdir}/usr/bin/jbang"

  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
