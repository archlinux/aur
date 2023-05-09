# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=qcopy
pkgver=2.0.0
pkgrel=1
pkgdesc="Easily save important snippets such as passwords for quick access copying at any point"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(fzf dialog xsel bat xdotool)
install="qcopy.install"
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.xz"
)
sha512sums=(
  '1609ab96821abab32bb82c46d1dc30dac14f80f7b08654ba67895cc4bca72b563fdb2a08fe2d7e4494339766983202daefc994c410d58687d0df3b7cd31869c0'
  )
md5sums=(
  '9d279e2db31df2e6b72ffebaa3a0a69f'
  )
validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
  )

package() {

  cd "$srcdir/${pkgname}-${pkgver}-${pkgrel}-${arch}" ||
  cd "$srcdir/${pkgname}"

  install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"

}
