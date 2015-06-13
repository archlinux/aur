# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>
# Submitter: Damir Jelic <poljarinho@gmail.com>
_pack=nnet
pkgname=octave-$_pack
pkgver=0.1.13
pkgrel=3
pkgdesc="The Octave-forge Nnet package for working with Neural Networks."
arch=('i686' 'x86_64')
url="http://octave.sourceforge.net/$_pack/index.html"
license=('GPL')
groups=('octave-forge')
depends=('octave')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver.tar.gz
source=("http://downloads.sourceforge.net/octave/$_pack-$pkgver.tar.gz")
noextract=("$_archive")
md5sums=('836ca48df2236eb0cb7e1e27780a1659')


build() {
  cd "$srcdir"
  mkdir -p builddir
  octave -q -f --eval "pkg build -verbose -nodeps builddir $_archive"
}

package() {
  mkdir -p "$pkgdir/usr/share/octave/packages"
  mkdir -p "$pkgdir/usr/lib/octave/packages"
  cp "$srcdir/builddir/$_archive" "$pkgdir/usr/share/octave/$_pack.tar.gz"
}
