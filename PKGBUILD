# Maintainer: Thor77 <thor77 at thor77 dot org>

pkgname=dnswalk
pkgver=2.0.2
pkgrel=1
pkgdesc="dnswalk is a DNS debugger"
url="http://sourceforge.net/projects/dnswalk/"
license=('GPL')
arch=(i686 x86_64)
depends=('perl-net-dns')
source=("http://heanet.dl.sourceforge.net/sourceforge/dnswalk/dnswalk-$pkgver.tar.gz" 'dnswalk.patch' 'makereports.patch')
md5sums=('62b9302822353fad71d51aefdae1cad1' 'e3cde1f934cf4ffc815453640efdad5c' '02778b076ed29d2a46d27e0d2513a8f3')

prepare() {
	cd $srcdir
	patch dnswalk dnswalk.patch
	patch makereports makereports.patch
}

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/bin
	cp {do-,}dnswalk $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/doc/dnswalk
	cp {CHANGES,README,TODO,rfc1912.txt,makereports,sendreports,dnswalk.errors} $pkgdir/usr/share/doc/dnswalk/
	mkdir -p $pkgdir/usr/man/man1
	cp dnswalk.1 $pkgdir/usr/man/man1/
}
