# Contributor: Andreas Baumann <mail at andreas baumann dot cc>

pkgname=woz2dsk
pkgver=r18.b10c59f
pkgrel=1
pkgdesc="woz2dsk is a utility for converting .woz files to .dsk, .po and .nib files."
arch=('x86_64')
url="https://github.com/leesaudan2/woz2dsk"
license=('GPL3')
depends=('perl' 'perl-file-slurp' 'perl-digest-crc' 'perl-getopt-long-descriptive')
makedepends=()
source=("${pkgname}::git+https://github.com/leesaudan2/woz2dsk.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  # perl script, nothing to build/compile
}

package() {
  cd "${pkgname}"
  install -D -m 755 "woz2dsk" "$pkgdir/usr/bin/woz2dsk"
  install -D -m 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
