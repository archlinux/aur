# Maintainer: Luiz Amaral <email at luiz dot eng dot br>
# Contributor: peeweep at 0x0 dot ee
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Bartosz Feński <fenio@debian.org>

pkgname=dh-make
pkgver=2.202304
pkgrel=1
pkgdesc="Tool that converts source archives into Debian package source"
arch=('any')
url="https://salsa.debian.org/debian/dh-make"
license=('GPL')
depends=('dpkg' 'make' 'python')
makedepends=('git')
source=("git+$url.git#tag=debian/$pkgver")
sha512sums=('7d986093d525cea2c5e7b32984de9be98a6c9d867174259657c11faadeb4db5ff5d7f314c8421c3037c0fce290587037d5af34109bb276a2b76739a4bfa4ab8f')

package() {
  cd "$srcdir/$pkgname"
  install -D dh_make.py "$pkgdir"/usr/bin/dh_make
  install -d "$pkgdir"/usr/share/debhelper/dh_make
  cp -a lib/* "$pkgdir"/usr/share/debhelper/dh_make/
  install -Dm644 dh_make.1 "$pkgdir"/usr/share/man/man8/dh_make.8
}

# vim:set ts=2 sw=2 et:
