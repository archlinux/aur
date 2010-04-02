# Contributor: Juan Pablo Gonzalez Tognarelli <lord_jotape@yahoo.com.ar>
 pkgname=uriparser
 pkgver=0.7.5
 pkgrel=1
 pkgdesc="uriparser is a strictly RFC 3986 compliant URI parsing library. uriparser is cross-platform, fast, supports Unicode" 
 url="http://sourceforge.net/projects/uriparser/" 
 depends=(glibc)
 makedepends=(doxygen)
 source=(http://downloads.sourceforge.net/sourceforge/uriparser/$pkgname-$pkgver.tar.bz2)
 md5sums=('4f4349085fe5de33bcae8d0f26649593')
 arch=('i686' 'x86_64')
 license="CUSTOM" 
 build() { 
        cd ${srcdir}/$pkgname-$pkgver
        ./configure --prefix=/usr --disable-test
	ln -s ${srcdir}/$pkgname-$pkgver/doc/Doxyfile.in ${srcdir}/$pkgname-$pkgver/doc/Doxyfile
        make || return 1	
	make DESTDIR=$startdir/pkg install || return 1
	install -D -m644 "${srcdir}/$pkgname-$pkgver/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || return 1
}  
                     