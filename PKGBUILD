# Maintainer: Nichlas Severinsen <ns@nsz.no>

pkgname=d2-bin
_gitname=d2
pkgver=0.7.1
pkgrel=1
pkgdesc='A modern diagram scripting language that turns text to diagrams'
arch=('x86_64' 'arm64')
url='https://d2lang.com'
license=('MPL2')
depends=('gcc-libs')
options=('!lto')
source_x86_64=("https://github.com/terrastruct/${_gitname}/releases/download/v${pkgver}/${_gitname}-v${pkgver}-linux-amd64.tar.gz")
source_arm64=("https://github.com/terrastruct/${_gitname}/releases/download/v${pkgver}/${_gitname}-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('eb172adf59f38d1e5a70ab177591356754ffaf9bebb84e0ca8b767dfb421dad7')
sha256sums_arm64=('ce3a0b985a8f91335a826c254b3a88736fd81afcdd08b58f6c749d2add6864b0')
conflicts=('d2')

package() {
  cd "${_gitname}-v${pkgver}"

  install -vDm755 -t "$pkgdir/usr/bin" bin/d2

  install -vDm644 -t "$pkgdir/usr/share/man/man1" man/d2.1

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt

}
