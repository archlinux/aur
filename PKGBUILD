# Maintainer: Gaspard d'Hautefeuille

pkgname=agetpkg-git
pkgver=4.r0.g673e371
pkgrel=2
pkgdesc='Archlinux Archive Get Package (Git version)'
arch=('any')
url='https://github.com/seblu/agetpkg'
license=('GPL-2.0-or-later')
makedepends=('git')
depends=('python' 'python-xdg')
conflicts=('agetpkg')
provides=('agetpkg')
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 agetpkg "$pkgdir/usr/bin/agetpkg"
}
