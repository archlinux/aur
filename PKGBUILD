# Maintainer: aksr <aksr at t-com dot me>
pkgname=uno
pkgver=2.13
pkgrel=2
pkgdesc="A simple tool for source code analysis, for ANSI-C programs."
arch=('i686' 'x86_64')
url="http://spinroot.com/uno/"
license=('custom')
source=("http://www.spinroot.com/uno/${pkgname}_v${pkgver//./}.tar.gz")
md5sums=('96ef927107462b2b22da3adc4cae71c6')
sha1sums=('299b810cb213a23d81c2abb24a6b13e6eec3617d')
sha256sums=('c688a5f7c68ba4b7c0907c6c2603703535c37b99b2a3927a391bd48c43d7bcbe')

build() {
  cd "$srcdir/$pkgname/src"
  make
}

package() {
  cd "$srcdir/$pkgname/src"
  mkdir -p $pkgdir/usr/{bin,share/{doc/$pkgname,man/man1}}
  make BINDIR="$pkgdir/usr/bin" install
  install -Dm644 ../doc/uno.1 $pkgdir/usr/share/man/man1/
  install -Dm644 ../doc/uno_long.pdf $pkgdir/usr/share/doc/$pkgname/uno_long.pdf
  install -Dm644 ../doc/uno_short.pdf $pkgdir/usr/share/doc/$pkgname/uno_short.pdf
  install -Dm644 ../doc/uno_man.pdf $pkgdir/usr/share/doc/$pkgname/uno_man.pdf
  install -Dm644 ../doc/uno_manpage.pdf $pkgdir/usr/share/doc/$pkgname/uno_manpage.pdf
}

