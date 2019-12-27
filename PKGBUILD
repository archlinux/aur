# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
# Contributor: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname=q
pkgver=2.0.8
pkgrel=1
pkgdesc="SQL-like queries on tabular text data, including joins and subqueries"
url="https://github.com/harelba/q"
license=('GPL3')
arch=('x86_64')
depends=('python')
source=("https://github.com/harelba/packages-for-q/raw/master/rpms/q-text-as-data-${pkgver}-1.x86_64.rpm")
sha256sums=('14e5edaf91da456eeed11e6ee4f0205a395d2d4b16421ab3dbefd0b49983c14b')

package() {
  cd "${srcdir}/"
  install -D -m755 "${srcdir}/usr/share/q-text-as-data/q" "${pkgdir}/usr/bin/${pkgname}"
  for doc in "usr/share/doc/q-text-as-data-${pkgver}/"*; do
    install -D -m644 "$doc" "${pkgdir}/usr/share/doc/q-text-as-data-${pkgver}/$doc"
  done
  install -D -m755 "${srcdir}/usr/share/man/man1/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}

# vim: set tabstop=4 shiftwidth=2 expandtab smarttab autoindent:
