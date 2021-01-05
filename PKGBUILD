# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Bartosz Feński <fenio@debian.org>

pkgname=dh-make
pkgver=2.202003
pkgrel=1
pkgdesc="Tool that converts source archives into Debian package source"
arch=('any')
url="http://packages.debian.org/sid/dh-make"
license=('GPL')
depends=('dpkg' 'make' 'python')
source=(https://deb.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz)
sha512sums=('03d95091321628e13c27bdbdbf4e0c26024bcb1a93d04a981d7df95e326305c691846949c7bcdaf4f9b579558e767ab8b55182fecdb7fd67c8aca371316488cc')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D dh_make.py "$pkgdir"/usr/bin/dh_make
  install -d "$pkgdir"/usr/share/debhelper/dh_make
  cp -a lib/* "$pkgdir"/usr/share/debhelper/dh_make/
  install -Dm644 dh_make.1 "$pkgdir"/usr/share/man/man8/dh_make.8
}

# vim:set ts=2 sw=2 et:
