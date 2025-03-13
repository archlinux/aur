# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-parse-distname'
pkgver='0.05'
pkgrel='2'
pkgdesc="parse a distribution name"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
checkdepends=('perl-test-differences>=0' 'perl-test-useallmodules>=0.17' 'perl-extutils-makemaker-cpanfile')
url='https://metacpan.org/release/Parse-Distname'
source=("http://search.cpan.org/CPAN/authors/id/I/IS/ISHIGAKI/Parse-Distname-${pkgver}.tar.gz")
md5sums=('ad672dbef9de3f93e1433771af690199')
sha512sums=('57896ecf281a321bee0c9ab8b297cb651dae779eb5948ff09bb15e56918049b11902063cf11560ad781f9768f977e0db85a0c59b2e5975cbc5140faf9e5cb498')
_distdir="Parse-Distname-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
