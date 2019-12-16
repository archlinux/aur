# Maintainer: Husam Bilal <me@husam.dev>
# Contributor: Doug Newgard <scimmia@archlinux.info>
# Contributor: Sergio Correia <sergio@correia.cc>
# Contributor: Nicolas Vivet <nizzox@gmail.com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

_pkgname=libphutil
pkgname="${_pkgname}-stable"
pkgver=conduit.5.r1417.g1750586f
pkgrel=1
pkgdesc='A collection of PHP utility classes'
arch=('any')
url="https://www.phacility.com/phabricator/"
license=('Apache')
depends=('php')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=('git+https://github.com/phacility/libphutil.git#branch=stable')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -d "$pkgdir/usr/share/php/$_pkgname"
  cp -a $_pkgname/* "$pkgdir/usr/share/php/$_pkgname/"
}
