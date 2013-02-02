# Maintainer: Matt Harrison <matt@mistbyte.com>
# Contributor: Sagar Chalise <chalisesagar@gmail.com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/geany-zencoding

pkgname=geany-zencoding
pkgver=0.22
pkgrel=1
pkgdesc="Zen Coding plugin for geany"
arch=('x86_64' 'i686')
url="https://github.com/codebrainz/geany-zencoding"
license=('GPL')
depends=('geany' 'python2')
makedepends=('intltool')
source=("https://github.com/codebrainz/geany-zencoding/tarball/51334a0259d48a972290dba4c471e1c1aa234931" "geany-zencoding.patch")
sha256sums=('bc2513582309bc7c787947ce1163ff5616855354ab1c1bf4f0b96da711ea72b8'
            '0f885d5443ad868595c8628118e9aba14f8a4a4d85fac8bb767ef21d7ec493ca')

build() {
  cd "$srcdir/codebrainz-geany-zencoding-51334a0/"
  patch -p1 -i $srcdir/geany-zencoding.patch
  ./autogen.sh
  ./configure --prefix=`pkg-config --variable=prefix geany`
  make
}

package() {
  cd "$srcdir/codebrainz-geany-zencoding-51334a0/"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
