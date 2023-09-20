# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Contributor: Guillaume Raffin ("theelectronwill") <theelectronwill@gmail.com>

pkgname=mill
pkgver=0.11.0m0
_commit=ea7227f68aa439d96f8d7f1369f2cb90714be932
pkgrel=1
pkgdesc="Your shiny new Java/Scala build tool"
arch=(any)
url="https://com-lihaoyi.github.io/mill/"
license=('MIT')
depends=('bash' 'java-environment')
makedepends=('git' 'mill')
source=("git+https://github.com/lihaoyi/mill.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd mill
  mill -i all __.publishLocal assembly
}

package() {
  cd mill
  install -Dm755 out/assembly.dest/mill "$pkgdir"/usr/bin/mill
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/mill/LICENSE
}
