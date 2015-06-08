# Maintainer: Wim de With <nauxuron@wimdewith.com>
_gitname=pacbuild
pkgname=${_gitname}-git
pkgver=8
pkgrel=1
pkgdesc="A simple abs wrapper to download single PKGBUILDs"
arch=('any')
url="https://github.com/Nauxuron/${_gitname}"
license=('GPL3')
groups=()
depends=('abs')
makedepends=('git')
source=("git+https://github.com/Nauxuron/pacbuild.git")
md5sums=('SKIP') #generate with 'makepkg -g'

pkgver() {
  cd "$srcdir/$_gitname"
  git rev-list --count HEAD
}
  
package() {
  cd "$srcdir/$_gitname"
  mkdir -p $pkgdir/usr/bin
  install -D -m755 ./pacbuild $pkgdir/usr/bin/pacbuild
}

# vim:set ts=2 sw=2 et:
