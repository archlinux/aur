# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moosex-types-datetime-morecoercions'
pkgver='0.15'
pkgrel='1'
pkgdesc="Extensions to MooseX::Types::DateTime"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime>=0.4302' 'perl-datetimex-easy>=0.085' 'perl-moose>=0.41' 'perl-moosex-types>=0.04' 'perl-moosex-types-datetime>=0.07' 'perl-time-duration-parse>=0.06' 'perl-namespace-clean>=0.19' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-fatal')
url='https://metacpan.org/release/MooseX-Types-DateTime-MoreCoercions'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Types-DateTime-MoreCoercions-0.15.tar.gz')
md5sums=('fe679ed09baf96dff62092538fc9466a')
sha512sums=('c0e3e1d1d4969d674d0c5d88b99aa401049b8ca7a61c3ec139a8e7c39d44e8a12ee2a8151029d24b1ef0063af3de6ec235c81c576ef21d6ab0b680f0a94cc020')
_distdir="MooseX-Types-DateTime-MoreCoercions-0.15"

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
