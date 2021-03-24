# Maintainer: Alfonso² Peterssen <a2peterssen+aur ÅT gmail DÖT com>
pkgname=('jbang')
pkgver=0.69.1
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
sha256sums=('9a1b3bb593900b274c47c8683d8eaf15df211e330c04c0b88523b7b0988eddf1'
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
