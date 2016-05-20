# Contributor: TDY <tdy@archlinux.info>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=rtfreader
_pkgname=ms-rtf
pkgver=1
pkgrel=1
pkgdesc="A portable application/ms-rtf parser."
arch=('i686' 'x86_64')
url="http://www.fiction.net/blong/programs/#rtf"
license=('unknown')
depends=('glibc')
source=("http://www.fiction.net/blong/programs/$_pkgname.tar.gz"
        $pkgname-hex.diff)
md5sums=('fa203d863ec479b36bcbed3abdd4e77e'
         'd81c6651bbec51e77cb88d050be1e147')

prepare() {
  cd "$srcdir/$_pkgname"
  patch -Np0 -i ../$pkgname-hex.diff
}

build() {
  cd "$srcdir/$_pkgname"
  make CFLAGS="$CFLAGS"
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

