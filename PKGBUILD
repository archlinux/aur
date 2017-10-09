# Maintainer : int <int [ate] arcor [dot] de>
# Contributor: Jason Ryan <jasonwryan@gmail.com>
# Contributor: Yuval Hager <yhager@yhager.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-data-ical'
pkgver='0.22'
pkgrel='4'
pkgdesc="Perl/CPAN Module Data::ICal: Generates iCalendar (RFC 2445) calendar files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.12' 'perl-class-accessor' 'perl-class-returnvalue' 'perl-text-vfile-asdata')
makedepends=()
checkdepends=('perl-test-longstring' 'perl-test-nowarnings' 'perl-test-warn')
url='https://metacpan.org/release/Data-ICal'
source=('http://search.cpan.org/CPAN/authors/id/A/AL/ALEXMV/Data-ICal-0.22.tar.gz')
md5sums=('7ba398c22481d8de8e2bb317173b3483')
sha512sums=('a02364dfb0a1e24efcf2efdb7240bb6c47ad5ed3a99ada51ddb9817b4e433038d57113699c6875f7d592cd3af46f5b074a1ac50cf951b7af449bde1765ed5d55')
_distdir="Data-ICal-0.22"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
