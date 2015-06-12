# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=perl-svn-look
pkgver=0.39
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
md5sums=('48d0443d0bb2c4a79c3141e553e699b6')

build() {
  cd $srcdir/SVN-Look-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor
  make
  make install DESTDIR=$pkgdir
  find $pkgdir -name perllocal.pod -delete
  find $pkgdir -name .packlist -delete
}
