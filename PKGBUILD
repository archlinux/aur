# Maintainer: Luiz Amaral <email at luiz dot eng dot br>
# Contributor: peeweep at 0x0 dot ee
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Bartosz Feński <fenio@debian.org>

pkgname=dh-make
pkgver=2.202503
pkgrel=1
pkgdesc="Tool that converts source archives into Debian package source"
arch=('any')
url="https://salsa.debian.org/debian/dh-make"
license=('GPL')
depends=('dpkg' 'make' 'python')
makedepends=('git')
source=("git+$url.git#tag=debian/$pkgver")
sha512sums=('c0d3e9de84c67948a42dde33c5bcc576f05c603614f7cb52af727f99625438b37a33d662a0f4f4d802eca31bcf448ac3b0c7325b54f55ab87cdd1f11c1f43635')

package() {
  cd "$srcdir/$pkgname"
  install -D dh_make.py "$pkgdir"/usr/bin/dh_make
  install -d "$pkgdir"/usr/share/debhelper/dh_make
  cp -a lib/* "$pkgdir"/usr/share/debhelper/dh_make/
  install -Dm644 dh_make.1 "$pkgdir"/usr/share/man/man8/dh_make.8
}

# vim:set ts=2 sw=2 et:
