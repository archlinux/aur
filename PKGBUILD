# Maintainer: Wim de With <nauxuron@wimdewith.com>
pkgname=pacbuild-git
pkgver=12
pkgrel=2
pkgdesc="A simple abs wrapper to download single PKGBUILDs"
arch=('any')
url="https://github.com/Nauxuron/${pkgname%-git}"
license=('GPL3')
groups=()
depends=('abs')
makedepends=('git')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git rev-list --count HEAD
}
  
package() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p $pkgdir/usr/bin
  install -D -m755 ./pacbuild $pkgdir/usr/bin/pacbuild
}

# vim:set ts=2 sw=2 et:
