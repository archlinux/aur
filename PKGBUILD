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
  'https://gitlab.com/a4to/get/-/archive/0.1.3/get-0.1.3.tar.gz'
)
sha512sums=(
  'aa2cd019017de64192c82efd56420018b3fe4bf0a2d620234a8a24b19db275171c5a039f426bb264bf9d31d2084d884c34daf56983663a0a1aac1ea6236f2157'
)
md5sums=(
  '402b834e251b5496b262b338adae8853'
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

