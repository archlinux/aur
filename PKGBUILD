# Maintainer: Florian Pritz <flo@xinu.at>
# Contributor: Testuser_01 <mail@nico-siebler.de>

pkgname=swaks
pkgver=20240103.0
pkgrel=2
pkgdesc='Swiss Army Knife SMTP; Command line SMTP testing, including TLS and AUTH'
arch=('any')
url="https://jetmore.org/john/code/${pkgname}/"
license=('GPL')
depends=('perl-net-dns' 'perl-net-ssleay')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jetmore/swaks/archive/v$pkgver.tar.gz")
sha256sums=('7b23c899142f68188678f45f5aceefa5186d75bef23bf85974f7e21a616c0b6e')

package() {
  cd "${pkgname}-${pkgver}"
  install -m755 -D "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  cd doc
  pod2man base.pod "${pkgname}.1"
  install -m644 -D "${pkgname}.1" "$pkgdir/usr/share/man/man1/${pkgname}.1"
}
