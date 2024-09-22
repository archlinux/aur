# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=get
pkgver=0.2.2
pkgrel=1
pkgdesc="A versatile tool for making HTTP requests and scraping web content"
arch=(x86_64)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(nodejs npm)
makedepends=(nodejs npm)
source=(
  'https://gitlab.com/a4to/get/-/archive/v0.2.2/get-v0.2.2.tar.gz'
)
sha512sums=(
  '632b36ecde8b2f62c00f8945675001f5d9494c211f985d7b2048675a385cc705a48c339a632c676aff8148c8ee782d0afd20ff523a31067d6de25dfdce4479bb'
)
md5sums=(
  '0b23d8e56bff6cce7de5c50060e5d402'
)
validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
)


package() {

  cd "${srcdir}/${pkgname}-${pkgver}" >/dev/null 2>&1 ||
  cd "${srcdir}/${pkgname}-v${pkgver}" >/dev/null 2>&1 ||
  cd "${srcdir}/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"

  npm install . --prefix "${pkgdir}/usr/share/${pkgname}"

  install -Dm755 app.js "${pkgdir}/usr/bin/get"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 package.json "${pkgdir}/usr/share/${pkgname}/package.json"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

