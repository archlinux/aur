# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
pkgname=instr2raw
_gitname=$pkgname
pkgver=20150311
pkgrel=1
pkgdesc="SF2/XI instrument inspection/conversion utilities + looppoint insertiontools for AIFF/WAV..all for loopedinstrument fanatics."
arch=(i686 x86_64)
url="https://github.com/coderofsalvation/instr2raw"
license=('AGPL')
depends=('libsndfile')
optdepends=('sox: used for normalizing samples')
makedepends=('git')
source=('git+https://github.com/coderofsalvation/instr2raw.git')
md5sums=('SKIP')

pkgver() {
  cd  "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "$srcdir/$_gitname"
  make

}

package() {
  cd "$srcdir/$_gitname"
  install -dm755 "$pkgdir/usr/bin"
  find bin -type f -executable -exec cp {} "$pkgdir/usr/bin" \;
}

