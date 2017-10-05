# Maintainer: aksr <aksr at t-com dot me>
pkgname=nrgrep
pkgver=1.1.2
pkgrel=2
epoch=
pkgdesc="NR-grep ([N]ondeterministic [R]everse [g]rep): a fast and flexible pattern matching tool"
arch=('i686' 'x86_64')
url="https://www.dcc.uchile.cl/~gnavarro/software/"
license=('GPL')
categories=()
groups=()
depends=()
makedepends=()
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://www.dcc.uchile.cl/~gnavarro/software/$pkgname.tar.gz"
        "https://www.dcc.uchile.cl/~gnavarro/ps/spe01.pdf")
noextract=()
options=()
md5sums=('509a4542ba88963f2b9811a196055b15'
         'f2f6c3a029ce15dcafeb951a93eab555')
sha1sums=('d0cc5f320e0c036d22449927e58dc4cef3b10bba'
          '3f7c17fed0770534fd9c77cc43a4b610c3160ee5')
sha256sums=('5d46b462cd0323a99bf805e30c7769ce1d240f1ffe79c09b6a5f26a829803de5'
            'dec8403db56efe9958643bb88632b057605d08b1fadd4589b3409a2a68a9a9ba')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 nrgrep $pkgdir/usr/bin/nrgrep
  install -D -m644 README $pkgdir/usr/share/doc/$pkgname/README
  install -D -m644 ../spe01.pdf $pkgdir/usr/share/doc/$pkgname/spe01.pdf
  install -D -m644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}

