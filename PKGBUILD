# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Archie <xMickael@ifrance.com>

pkgname=tk-matchentry
pkgver=0.4
pkgrel=4
pkgdesc="Entry widget with advanced auto-completion capability"
depends=('tk' 'perl-tk')
arch=('any')
license=('GPL')
source=(http://search.cpan.org/CPAN/authors/id/W/WH/WHOM/Tk-MatchEntry-$pkgver.tar.gz)
url="http://search.cpan.org/~whom/Tk-MatchEntry/"
md5sums=('aad058937866810a67e973d24a8a8380')

build() {
	cd $srcdir/Tk-MatchEntry-$pkgver
	perl Makefile.PL
	make
}

package() {
	cd $srcdir/Tk-MatchEntry-$pkgver
	make DESTDIR=$startdir/pkg/ install
	# remove perllocal.pod and .packlist
	find $pkgdir -name perllocal.pod -delete
	find $pkgdir -name .packlist -delete
	}
