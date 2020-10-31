# Maintainer: Florian Pritz <flo@xinu.at>
# Contributor: Testuser_01 <mail@nico-siebler.de>

pkgname=swaks
pkgver=20201014.0
pkgrel=1
pkgdesc='Swiss Army Knife SMTP; Command line SMTP testing, including TLS and AUTH'
arch=('any')
url="https://jetmore.org/john/code/${pkgname}/"
license=('GPL')
depends=('perl-net-dns' 'perl-net-ssleay')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jetmore/swaks/archive/v$pkgver.tar.gz")
md5sums=('b8be0de2db7d118ca601375149c84834')

package() {
  cd "${pkgname}-${pkgver}"
  install -m755 -D "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  cd doc
  pod2man base.pod "${pkgname}.1"
  install -m644 -D "${pkgname}.1" "$pkgdir/usr/share/man/man1/${pkgname}.1"
}
