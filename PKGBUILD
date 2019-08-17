# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Bartosz Feński <fenio@debian.org>

pkgname=dh-make
pkgver=2.201901
pkgrel=1
pkgdesc="Tool that converts source archives into Debian package source"
arch=('any')
url="http://packages.debian.org/sid/dh-make"
license=('GPL')
depends=('dpkg' 'make' 'python')
source=(https://deb.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz)
sha256sums=('c4c248fd1fea21e6d8869f73ef122bf0233df713d6004583e69946dc023d33ff')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D dh_make "$pkgdir"/usr/bin/dh_make
  install -d "$pkgdir"/usr/share/debhelper/dh_make
  cp -a lib/* "$pkgdir"/usr/share/debhelper/dh_make/
  install -Dm644 dh_make.1 "$pkgdir"/usr/share/man/man8/dh_make.8
}

# vim:set ts=2 sw=2 et:
