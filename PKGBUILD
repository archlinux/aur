# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Nils Czernia <nils[at]czserver[dot]de>

pkgname=dnsvi
_pkgname=debian
pkgver=1.5
pkgrel=1
pkgdesc="Edit dynamic DNS zones in vi"
arch=("any")
url="https://github.com/ChristophBerg/dnsvi"
license=("GPL3")
depends=("perl" "bind-tools" "perl-sort-naturally")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/df7cb/dnsvi/archive/refs/tags/debian/${pkgver}.tar.gz")
sha512sums=('fda5fa236377a9d2d02daa025fec4e0371d7339c380965009b4142168a7879d65129c4ea6d5bcf6bd936c12e175529bdbbe54fda867aa006d2186706725f6b5c')

build() {
  cd ${srcdir}/${pkgname}-${_pkgname}-${pkgver}
  make all
}

package() {
  cd ${srcdir}/${pkgname}-${_pkgname}-${pkgver}
  install -Dm755 dnsvi ${pkgdir}/usr/bin/dnsvi
  install -Dm644 dnsvi.1 ${pkgdir}/usr/share/man/man1/dnsvi.1
}
