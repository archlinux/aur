# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=get
pkgver=0.2.0
pkgrel=1
pkgdesc="A versatile tool for making HTTP requests and scraping web content"
arch=(x86_64)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(nodejs npm)
makedepends=(nodejs npm)
source=(
  'https://gitlab.com/a4to/get/-/archive/v0.2.0/get-v0.2.0.tar.gz'
)
sha512sums=(
  '6d9ee5815a575b55a4d379fb1443c76f4164579b787e45cbb7e916567b9a3817fbbb3c29d78e3db096e8936b0ed0960b2e9e22008c5bc65fdf446460871cbad4'
)
md5sums=(
  '5f93116f7cf8e6a4e1128a6e56234a61'
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

