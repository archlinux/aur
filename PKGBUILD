# Maintainer: Black_Codec <orso.f.regna@gmail.com>

pkgname=jwmappmenugen-git
_pkgname=jwmappmenugen
pkgver=0.1
pkgrel=5
pkgdesc="A simple menu generator for the Joe's Window Manager based on fbmenugen."
arch=('any')
url="https://github.com/BlackCodec/jwmappmenugen/tree/master"
license=('GPL')
depends=('perl>=5.14.0' 'jwm' 'perl-data-dump' 'perl-linux-desktopfiles>=0.08')
source=("https://github.com/BlackCodec/$_pkgname/archive/master.zip")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname-master"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
   install -Dm 755 "$srcdir/$_pkgname-master/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
