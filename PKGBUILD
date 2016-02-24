# Maintainer: Sébastien Luttringer

pkgname=agetpkg-git
pkgver=2.r0.g56f5023
pkgrel=5
pkgdesc='Archlinux Archive Get Package (Git version)'
arch=('any')
url='https://github.com/seblu/agetpkg'
license=('GPL2')
makedepends=('git')
depends=('python' 'python-xdg')
conflicts=('agetpkg')
provides=('agetpkg')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 agetpkg "$pkgdir/usr/bin/agetpkg"
}

# vim:set ts=2 sw=2 et:
