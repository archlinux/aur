# Maintainer: Antoni Spaanderman <56turtle56@gmail.com>

pkgname=nspirefs-fuse-git
pkgver=5.c33e782
pkgrel=1
pkgdesc="Fuse filesystem for TI-Nspire calculators"
arch=('any')
url=https://github.com/antonilol/nspirefs-fuse
license=('MIT')
source=("nspirefs-fuse::git+$url")
md5sums=('SKIP')
depends=('fuse' 'nodejs' 'nspire-tools-git')
makedepends=('git' 'npm')

build() {
  cd "$srcdir/nspirefs-fuse"
  npm i
}

package() {
  cd "$pkgdir"
  mkdir -p usr/{bin,lib}
  cp -r "$srcdir"/nspirefs-fuse usr/lib/"$pkgname"
  ln -sr usr/lib/"$pkgname"/nspirefs-fuse.js usr/bin/nspirefs-fuse
}
