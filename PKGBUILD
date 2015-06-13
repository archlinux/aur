# Contributor: Rudy Matela <rudy.matela@gmail.com>
pkgname=testregex
pkgver=20040531
pkgrel=1
pkgdesc="The AT&T Research regression test harness for the X/Open regex pattern match interface"
arch=('i686' 'x86_64')
url="http://www2.research.att.com/~astopen/testregex/"
license=('MIT')
depends=('glibc')
makedepends=()
source=('http://www2.research.att.com/~astopen/testregex/testregex.c'
		'http://www2.research.att.com/~astopen/man/man1/testregex.html'
        'http://www2.research.att.com/~astopen/testregex/basic.dat'
        'http://www2.research.att.com/~astopen/testregex/categorize.dat'
		'http://www2.research.att.com/~astopen/testregex/nullsubexpr.dat'
		'http://www2.research.att.com/~astopen/testregex/leftassoc.dat'
		'http://www2.research.att.com/~astopen/testregex/rightassoc.dat'
		'http://www2.research.att.com/~astopen/testregex/forcedassoc.dat'
		'http://www2.research.att.com/~astopen/testregex/repetition.dat')
sha1sums=('a5a7ef57a3f74ca815575413be7eb30fe3cfce43'
          '04e2cab4d3a66eb958e310113b577e9f6836c170'
          '5141d8137ea32e3b1bfe5b48717ca6d3a15e8474'
          'caa616186ff066fc2109c3344881ae86ce6c4e92'
		  'e23bcae3bce2cfea0ea9fe239fca5d6abbeb2ff4'
		  'aef51decc245bc37c8f6c25b694403b0e0a50d6e'
		  '3037bdadbd52b3951e8e632b1cfcced1197db8f7'
		  'e2f121f57a813b09293432b6be0dfebca350a629'
		  '362485685397c26b1e3a6dec6bf2607a4e5b87de')

build() {
	gcc -D_POSIX_C_SOURCE=200112L $srcdir/testregex.c -o $srcdir/testregex
}

package() {
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/doc/testregex
	mkdir -p $pkgdir/usr/share/testregex
	install -s -m755 $srcdir/testregex $pkgdir/usr/bin
	install -m644 $srcdir/testregex.html $pkgdir/usr/share/doc/testregex
	install -m644 $srcdir/*.dat $pkgdir/usr/share/testregex
}

