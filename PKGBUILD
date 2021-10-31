# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Bartosz Feński <fenio@debian.org>

pkgname=dh-make
pkgver=2.202102
pkgrel=1
pkgdesc="Tool that converts source archives into Debian package source"
arch=('any')
url="http://packages.debian.org/sid/dh-make"
license=('GPL')
depends=('dpkg' 'make' 'python')
source=(https://deb.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz)
sha512sums=('fedaca9b681622ae30e66de7932d909f47778cb5c55346f1616378a501d6fb68920c6a820df2ca9111e3f372f93449aeaa8485493fb4472f70122541b372b97a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D dh_make.py "$pkgdir"/usr/bin/dh_make
  install -d "$pkgdir"/usr/share/debhelper/dh_make
  cp -a lib/* "$pkgdir"/usr/share/debhelper/dh_make/
  install -Dm644 dh_make.1 "$pkgdir"/usr/share/man/man8/dh_make.8
}

# vim:set ts=2 sw=2 et:
