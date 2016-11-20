# Contributor: Paolo Herms

pkgname=z3-bin
pkgver=4.1
pkgrel=1
pkgdesc="An automatic theorem prover"
arch=(i686 x86_64)
url="http://research.microsoft.com/en-us/um/redmond/projects/z3"
license=('custom')
source=("http://research.microsoft.com/projects/z3/z3-$pkgver.tar.gz" 
    'http://research.microsoft.com/en-us/downloads/0a7db466-c2d7-4c51-8246-07e25900c7e7/Z%203%20MSR-LA%20(2007-07-07).txt')
md5sums=('4b7b4836264a7969f052cea45057e55b'
         'c5f05e7f2f95c796d5101069276d326f')
[[ "$CARCH" = x86_64 ]] && {
    source[0]="http://research.microsoft.com/projects/z3/z3-x64-$pkgver.tar.gz"
    md5sums[0]='c4beeb5e86fe8dc0baf35a2e2a51476e'
}

build() {
  install -D "$srcdir"/z3/bin/z3 "$pkgdir"/usr/bin/z3
  install -m644 -D "$srcdir/Z%203%20MSR-LA%20(2007-07-07).txt" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

