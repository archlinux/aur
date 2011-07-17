# Maintainer: Florian Pritz <flo@xinu.at>
# Contributor: Testuser_01 <mail@nico-siebler.de>

pkgname=swaks
pkgver=20100211.0
pkgrel=2
pkgdesc='Swiss Army Knife SMTP; Command line SMTP testing, including TLS and AUTH'
arch=('any')
url="http://jetmore.org/john/code/${pkgname}/"
license=('GPL')
depends=('perl-net-dns')
source=("http://jetmore.org/john/code/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('b2ad29237f54208989a738c9a39a95f2')

package() {
  cd "${pkgname}-${pkgver}"
  install -m755 -D "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  cd doc
  pod2man ref.pod "${pkgname}.1"
  install -m644 -D "${pkgname}.1" "$pkgdir/usr/share/man/man1/${pkgname}.1"
}

