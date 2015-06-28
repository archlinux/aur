# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=funnelweb
pkgver=3.2.0
pkgrel=1
epoch=
pkgdesc="A powerful literate-programming macro preprocessor."
arch=(any)
url="http://www.ross.net/funnelweb/"
license=('GPLv2')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=funnelweb.install
changelog=
source=("http://www.ross.net/funnelweb/download/funnelweb_v320/funnelweb_v320_source.tar.gz"
        "funnelweb.install")
noextract=()
md5sums=('5846515b9d24c9b40a23da8afc857a2c'
         'aa285f8379d9d62b469591e0a2dd0bd7')
sha1sums=('4e361f6fc3dbb4c1021ccb80eaf0b66a7dfd460e'
          'a04275545e245ac5e884d9c0ec32908988a58e33')
sha256sums=('8f13cb6fd3f4d2563bb41bd13509550db14bd78a68da2a42cb4bbd2481f6107f'
            '93b550ff61543e6628a858cb28d70c7a850da8aa4fbfc7172830eae70fc78014')

build() {
  cd "$srcdir/fw_src/source"
  #gcc $CFLAGS $LDFLAGS -o fw *.c || return 1
  gcc -o fw *.c
}

package() {
  cd "$srcdir/fw_src/"
  mkdir -p $pkgdir/usr/{bin,share/funnelweb,share/texmf/tex/$pkgname}
  install -D -m755 source/fw          $pkgdir/usr/bin/fw
  install -D -m644 source/texhead.tex $pkgdir/usr/share/texmf/tex/$pkgname/texhead.tex
  install -D -m644 admin/0readme.txt  $pkgdir/usr/share/doc/$pkgname/README
  cd $pkgdir/usr/bin
  ln -s fw funnelweb
}

