# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=editenv
pkgver=0.2.3
pkgrel=1
pkgdesc="A simple command line tool for conveniently storing and editing environment variables."
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(dialog xsel)
optdepends=('zsh: zsh completion')
install="${pkgname}.install"
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.xz"
)
sha512sums=(
  '9f4e4c69e61922d6c2f2fb1438b56021930c0fbaf2f91794d3e8256162029e70abb11faa4257fc563b0aa6c3f6ff440b25e4e982196714e37a51a11603993f47'
)
md5sums=(
  'd0296391daabf6b6d5e154c72c50ea64'
)
validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
)

package() {

  cd "$srcdir/${pkgname}-${pkgver}-${pkgrel}-${arch}" ||
  cd "$srcdir/${pkgname}"

  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 usr/share/zsh/site-functions/_${pkgname} "$pkgdir/usr/share/zsh/site-functions/_${pkgname}"

}
