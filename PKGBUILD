# Maintainer: Lari Tikkanen <lartza@wippies.com>
# Contributor: Andrew Smith <ChucklesTheBeard@gmail.com>
# Contributor: Patrik Plihal <patrik.plihal@gmail.com>

pkgname=ckan-git
pkgver=1.22.3.r0.g64309722
pkgrel=1
pkgdesc="A metadata repository and associated tools for searching, installing, and managing mods for Kerbal Space Program (KSP)"
arch=('any')
url="https://github.com/KSP-CKAN/CKAN"
license=('MIT')
provides=('ckan')
conflicts=('ckan')
depends=('mono' 'curl')
makedepends=('git' 'python2' 'python2-requests')
source=('git://github.com/KSP-CKAN/CKAN')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/CKAN"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/CKAN"
  ./build
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp $srcdir/CKAN/_build/ckan.exe "$pkgdir/usr/bin/ckan"
}
