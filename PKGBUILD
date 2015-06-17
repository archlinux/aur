# Maintainer: yozi <es.mslj TA xunilhcra> backwards
# Contributor: yozi <es.mslj TA xunilhcra> backwards
pkgname='libtocc'
pkgver='1.0.1'
pkgrel=3
pkgdesc='Library for tocc, the tag-based file management system'
arch=('i686' 'x86_64')
url='http://t-o-c-c.com/libtocc'
license=('GPL3')
depends=('unqlite-unofficial' 'gcc-libs-multilib')
checkdepends=('libcatch-cpp-headers')
changelog=
source=("https://github.com/aidin36/tocc/releases/download/v$pkgver/tocc-$pkgver.tar.gz"
        "https://github.com/aidin36/tocc/releases/download/v$pkgver/tocc-$pkgver.tar.gz.sig")
validpgpkeys=(# Aidin Gharibnavaz <aidin@t-o-c-c.com>
              'FC34B251315AF6668AA1FB30F8A5FC9979B75433')
sha256sums=('c880171c2a94cc298cf073ad347205763080c15710407834627aa24a4e93a2cd'
            'SKIP')
sha384sums=('2f35616be2906600e2ea19244222e894ac675cc9a62e00f9e2f15a0c81853b341747a56d4b6e1f34665b4fb8ffc0a541'
            'SKIP')
sha512sums=('a1c1abcf097d3e8c7782ef6bfa3d62d91b53db6c20348cbaa16f2c082fbbe46d42a2609d0da8bd1790eb578be450e9d0f6f78041e25d14ec0b61ffba453b4140'
            'SKIP')

build() {
  cd "$srcdir/tocc-$pkgver/libtocc/src"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/tocc-$pkgver/libtocc/src"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
