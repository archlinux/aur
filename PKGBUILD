# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-uri-cpan'
pkgver='1.009'
pkgrel='2'
pkgdesc="URLs that refer to things on the CPAN"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-cpan-distnameinfo>=0' 'perl-uri>=0' 'perl>=5.012')
makedepends=()
url='https://metacpan.org/release/URI-cpan'
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/URI-cpan-${pkgver}.tar.gz")
md5sums=('0a3fceeff737ec836aae8332fc1d43e6')
sha512sums=('7f9cedb6d3df1e012dddb1f848dcbf3ad8bd62073aee75a795b907c70a0f3d93a10f3b6da03b00a2d3ead87fa288fae4efb69ea980c6c7fcf5eef34782cc9812')
_distdir="URI-cpan-${pkgver}"

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
