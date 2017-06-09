# Maintainer: alienzj <lovelornpig@gmail.com>

pkgname=seqtk
pkgver=1.2.r102.32e7903
pkgrel=1
pkgdesc="Toolkit for processing sequences in FASTA/Q formats"
arch=('any')
url="https://github.com/lh3/seqtk"
license=('MIT')
makedepends=('zlib')
provides=('seqtk')
conflicts=('seqtk')
source=("git://github.com/lh3/seqtk.git")
md5sums=('SKIP')

pkgver() {
  cd seqtk
  echo "1.2.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd seqtk
  make
}

package() {
  #make DESTDIR=${pkgdir} install
  cd seqtk
  cp seqtk ${pkgdir}/usr
  #install -Dm644 seqtk/LICENSE ${pkgdir}/usr/share/licenses/seqtk/LICENSE
}
