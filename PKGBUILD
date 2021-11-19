# Maintainer: Antoni Spaanderman <56turtle56@gmail.com>

pkgname=nspirefs-fuse-git
pkgver=4.5da7201
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
  cd "$srcdir"
  mkdir -p "$pkgdir"/usr/{bin,lib}
  cp -r nspirefs-fuse "$pkgdir"/usr/lib/"$pkgname"
}

