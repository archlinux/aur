# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=snip
pkgver=1.1.5
pkgrel=1
pkgdesc="A simple snippet manager for your predefined Ultisnips Snippet Directory"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(neovim)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.xz"
)
sha512sums=(
  'f14324c6137eb686e08e3d6dc5d9f00bb6eda0da3918f6457dd1bd5f529d0092a092025bf03a88fb9a28deaf87f5a9678e6d69be6a0e883c884c3d0c3cf964a5'
)
md5sums=(
  '955bed8dbcca4efaec8d39d168df60ce'
)
validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
)

package() {

  cd "$srcdir/${pkgname}-${pkgver}-${pkgrel}-${arch}" ||
  cd "$srcdir/${pkgname}"

  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm755 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}usr/share/man/man1/${pkgname}.1.gz"

}
