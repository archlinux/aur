# Maintainer: Scott Lawrence <bytbox@gmail.com>

pkgname=sloc
pkgver=1.3.1
pkgrel=1
pkgdesc='Simple source-lines-of-code counter'
arch=('i686' 'x86_64')
url="https://github.com/bytbox/sloc/"
license=('MIT')
optdepends=('perl-datetime' 'perl-json' 'perl-switch' 'gnuplot')
makedepends=('git' 'go' 'perl')
source=("sloc::git+$url#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd sloc
  ./gen-man.sh

  go build
}

package() {
  cd sloc
  install -Dm755 sloc "$pkgdir"/usr/bin/sloc
  install -Dm755 reposloc "$pkgdir"/usr/bin/reposloc
  install -Dm644 reposloc.1 "$pkgdir"/usr/share/man/man1/reposloc.1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/sloc/LICENSE
}
