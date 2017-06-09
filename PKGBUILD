# Maintainer: alienzj <lovelornpig@gmail.com>

pkgname=seqtk-git
pkgver=1.2.r102.32e7903
pkgrel=1
pkgdesc="Toolkit for processing sequences in FASTA/Q formats"
arch=('i686' 'x86_64')
url="https://github.com/lh3/seqtk"
license=('MIT')
makedepends=('zlib')
provides=('seqtk')
conflicts=('seqtk')
source=("git://github.com/lh3/seqtk.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/seqtk
  echo "1.2.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/seqtk
  make
}

package() {
  cd $srcdir/seqtk
  install -Dm755 seqtk $pkgdir/usr/bin/seqtk
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/seqtk/LICENSE
}
