# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=get
pkgver=0.1.3
pkgrel=1
pkgdesc="A versatile tool for making HTTP requests and scraping web content"
arch=(x86_64)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(nodejs npm)
makedepends=(nodejs npm)
source=(
  "https://software.concise.cc/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.xz"
)
sha512sums=(
  '7941b56a41e69181998a2ee1d40e1f02b1dc781b51d34eadaca9194981a26ecafe93072511fcb0781608a18681252c3a961c1b9057cbc86bf226c1a7350d6dc6'
)
md5sums=(
  '60bcf019758859c11808d282fa468108'
)
validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
)

package() {

  cd "${srcdir}/${pkgname}-${pkgver}" >/dev/null 2>&1 || cd "${srcdir}/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"

  npm install . --prefix "${pkgdir}/usr/share/${pkgname}"

  install -Dm755 app.js "${pkgdir}/usr/bin/get"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 package.json "${pkgdir}/usr/share/${pkgname}/package.json"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

