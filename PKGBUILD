# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=perl-svn-look
pkgver=0.43
pkgrel=1
pkgdesc="svnlook perl bindings"
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/SVN-Look/"
depends=('perl' 'perl-extutils-makemaker'
	 'perl-carp' 'perl-uri' 'perl-file-temp'
	 'perl-file-path' 'perl-list-moreutils'
	 'subversion')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/G/GN/GNUSTAVO/SVN-Look-$pkgver.tar.gz)
md5sums=('75f5eb52b58cc2eaf49342a2a094ebca')

build() {
  cd $srcdir/SVN-Look-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd $srcdir/SVN-Look-${pkgver}
  make install DESTDIR=$pkgdir
  find $pkgdir -name perllocal.pod -delete
  find $pkgdir -name .packlist -delete
}
