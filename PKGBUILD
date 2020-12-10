# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
# Contributor: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname=q
pkgver=2.0.19
pkgrel=1
pkgdesc="SQL-like queries on tabular text data, including joins and subqueries"
url="https://github.com/harelba/q"
license=('GPL3')
arch=('x86_64')
depends=('python')
source=("https://github.com/harelba/q/releases/download/${pkgver}/q-text-as-data-${pkgver}-1.x86_64.rpm")
sha256sums=('b233f1e2eb3dc913dac7d138e439b14c8e8872ce1e49289a62b817d4ce1e9484')

package() {
  cd "${srcdir}/"
  install -D -m755 "${srcdir}/usr/share/q-text-as-data/q" "${pkgdir}/usr/bin/${pkgname}"
  for doc in "usr/share/doc/q-text-as-data-${pkgver}/"*; do
    if [[ "${doc##*/}" == "LICENSE" ]]; then
      install -D -m644 "${doc}" "${pkgdir}/usr/share/license/q-text-as-data/${doc##*/}"
    else
      install -D -m644 "${doc}" "${pkgdir}/usr/share/doc/q-text-as-data/${doc##*/}"
    fi
  done
  install -D -m755 "${srcdir}/usr/share/man/man1/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}

# vim: set tabstop=4 shiftwidth=2 expandtab smarttab autoindent:
