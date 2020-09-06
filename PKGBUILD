# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Bartosz Feński <fenio@debian.org>

pkgname=dh-make
pkgver=2.202002
pkgrel=1
pkgdesc="Tool that converts source archives into Debian package source"
arch=('any')
url="http://packages.debian.org/sid/dh-make"
license=('GPL')
depends=('dpkg' 'make' 'python')
source=(https://deb.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz)
sha512sums=('3f5adfd5ea1c8585821e3c4742ea654bd1d48f36e99d95805c1a659e803b882933ce0f36b0fb1402d473cf5a8a7852682e2d89f0534ab49c3d23f8740fe3a3eb')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D dh_make.py "$pkgdir"/usr/bin/dh_make
  install -d "$pkgdir"/usr/share/debhelper/dh_make
  cp -a lib/* "$pkgdir"/usr/share/debhelper/dh_make/
  install -Dm644 dh_make.1 "$pkgdir"/usr/share/man/man8/dh_make.8
}

# vim:set ts=2 sw=2 et:
