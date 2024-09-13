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
  '5f30a3d27cc779b971ab4bfa30c9d5edaa2c84949565d4edbc9a0d8e646af43194867572a414d5c1b71fa149e3e26cbd4dfa65843a65ef215b4233511b8e073b'
)
md5sums=(
  'b96ccface8612fe8583b3a06b3000284'
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

