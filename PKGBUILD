# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=get
pkgver=0.1.4
pkgrel=1
pkgdesc="A versatile tool for making HTTP requests and scraping web content"
arch=(x86_64)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(nodejs npm)
makedepends=(nodejs npm)
source=(
  'https://gitlab.com/a4to/get/-/archive/v0.1.4/get-v0.1.4.tar.gz'
)
sha512sums=(
  '3fd314ca22dfa4a27e7b33a921ac108f0ffc8eafec2e7d88cea2087e772ad4e748ba7eabce57419300291f0b4e16ddf957ee4ee223a3afa1b75523d98440bfc3'
)
md5sums=(
  '548a06e0d638c6b3723489d59909c12a'
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

