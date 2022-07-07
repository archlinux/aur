# Maintainer: Bryan Malyn <bim9262 at gmail dot com>

pkgname=asa
pkgver=1.2
pkgrel=1
pkgdesc='Convert Fortran carriage control characters'
arch=('any')
license=('GPL2')
source=('http://archive.debian.org/debian/dists/slink/main/source/text/asa_1.2.orig.tar.gz'
        'https://src.fedoraproject.org/rpms/asa/raw/f16/f/asa-1.2-declare.patch')
sha256sums=('3a4189cd3e3da1d702031d619a9529cb247363a41ce037f14fc9b95228dbf603'
            'a5a51ba2374179b0da2a1f2013dd732fbd5044776baea8b5f36e265843281f7f')

prepare() {
  patch $pkgname-$pkgver/asa.c asa-1.2-declare.patch
}

build(){
  cd $pkgname-$pkgver
  make
}

package() {
 install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
