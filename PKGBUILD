# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Archie <xMickael@ifrance.com>

pkgname=tk-matchentry
pkgver=0.5
pkgrel=1
pkgdesc="Entry widget with advanced auto-completion capability"
depends=('tk' 'perl-tk')
arch=('any')
license=('GPL')
source=(https://cpan.metacpan.org/authors/id/A/AS/ASB/Tk-MatchEntry-${pkgver}.tar.gz)
url="https://metacpan.org/pod/Tk::MatchEntry"
md5sums=('51261a69f23067ac18d29a53d366f5d2')

build() {
	cd $srcdir/Tk-MatchEntry-$pkgver
	perl Makefile.PL
	make
}

package() {
	cd $srcdir/Tk-MatchEntry-$pkgver
	make DESTDIR=$pkgdir install
	# remove perllocal.pod and .packlist
	find $pkgdir -name perllocal.pod -delete
	find $pkgdir -name .packlist -delete
	}
