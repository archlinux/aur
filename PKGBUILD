# Maintainer: Florian Pritz <flo@xinu.at>
# Contributor: Testuser_01 <mail@nico-siebler.de>

pkgname=swaks
pkgver=20120320.0
pkgrel=1
pkgdesc='Swiss Army Knife SMTP; Command line SMTP testing, including TLS and AUTH'
arch=('any')
url="http://jetmore.org/john/code/${pkgname}/"
license=('GPL')
depends=('perl-net-dns')
source=("http://jetmore.org/john/code/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('1c0b8cfc92aa4a36f3136c15d4f87e9b')

package() {
  cd "${pkgname}-${pkgver}"
  install -m755 -D "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  cd doc
  pod2man ref.pod "${pkgname}.1"
  install -m644 -D "${pkgname}.1" "$pkgdir/usr/share/man/man1/${pkgname}.1"
}

