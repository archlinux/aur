# Maintainer: Daniel M. Capella <polycitizen@gmail.com>
# Contributor: Scott Lawrence <bytbox@gmail.com>

pkgname=sloc
pkgver=0.3.1
pkgrel=1
pkgdesc="Simply counts source lines of code"
arch=('i686' 'x86_64')
url='http://bytbox.net/hacks/sloc'
license=('MIT')
depends=('go')
optdepends=('perl-datetime' 'perl-json' 'perl-switch' 'gnuplot')
makedepends=(git)
source=("sloc::git+http://git.bytbox.net/sloc/#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd sloc
  ./gen-man.sh

  cd sloc
  go build -o sloc
}

package() {
  cd sloc
  install -D -m755 sloc/sloc "$pkgdir"/usr/bin/sloc
  install -D -m755 reposloc "$pkgdir"/usr/bin/reposloc
  install -D -m644 reposloc.1 "$pkgdir"/usr/share/man/man1/reposloc.1
}

# vim:set ts=2 sw=2 et:
