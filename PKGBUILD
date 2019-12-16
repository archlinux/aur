# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
# Contributor: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname=q
pkgver=2.0.6
pkgrel=1
pkgdesc="SQL-like queries on tabular text data, including joins and subqueries"
url="https://github.com/harelba/q"
license=('GPL3')
arch=('x86_64')
depends=('python')
source=("https://github.com/harelba/packages-for-q/raw/master/rpms/q-text-as-data-${pkgver}-1.x86_64.rpm")
sha256sums=('d012b7f5276cfa630c518906da7d2aec4b6556f20594b76957549dbc3f5b0d92')

package() {
  install -D -m755 "${srcdir}/usr/share/q-text-as-data/q" "${pkgdir}/usr/bin/${pkgname}"
  for doc in "${srcdir}/usr/share/doc/q-text-as-data-${pkgver}/"*; do
    install -D -m644 "$doc" "${pkgdir}/usr/share/doc/q-text-as-data-${pkgver}/$doc"
  done
  install -D -m755 "${srcdir}/usr/share/man/man1/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}

# vim: set tabstop=4 shiftwidth=2 expandtab smarttab autoindent:
