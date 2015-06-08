# Maintainer: s1gma <s1gma@mindslicer.com>

_pkgname=metasm
pkgname=metasm-hg
pkgver=2985.70a8a57c6f18
pkgrel=1
pkgdesc="An assembly manipulation suite written in Ruby"
arch=('any')
url="http://metasm.cr0.org/"
license=('LGPL')
depends=('ruby')
optdepends=('ruby-gtk2: gui support')
provides=('metasm')
install=metasm.install
source=('metasm::hg+https://code.google.com/p/metasm/')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$srcdir/$_pkgname"
  
  msg "Starting make..."
  rm -rf "$srcdir/$_pkgname-build"
  cp -r "$srcdir/$_pkgname" "$srcdir/$_pkgname-build"
  cd "$srcdir/$_pkgname-build"
  
  # remove mercurial files
  rm -rf .hg/ .hgtags
}

package() {
  cd "$srcdir/$_pkgname-build"
  mkdir -p $pkgdir/opt/metasm
  cp -a * $pkgdir/opt/metasm
} 
