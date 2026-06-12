# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>

pkgname=man-pages-postgresql-ja
pkgver=18.3
pkgrel=1
pkgdesc="Japanese man pages for PostgreSQL"
arch=('any')
url="https://pgsql-jp.github.io/"
license=('PostgreSQL')
source=(
  "man-${pkgver}.tar.gz::${url}jpug-doc/${pkgver}/man.tar.gz"
  "legalnotice-${pkgver}.html::${url}jpug-doc/${pkgver}/html/legalnotice.html"
)
sha256sums=('f854b7189199e2a71de2bd0591ae48ceecdb15bc4c9bd1d037125ae4afcd0527'
            '2b8aeb6af136569e61d2705e731a2f9d3afe0838967ebeee23a64c3b7d772bb8')

package() {
  local section

  for section in 1 3 7; do
    install -Dm644 -t "${pkgdir}/usr/share/man/ja/man${section}" \
      "man${section}"/*."${section}"
  done

  install -Dm644 "legalnotice-${pkgver}.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/legalnotice.html"
}
