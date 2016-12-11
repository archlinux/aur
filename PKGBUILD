# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-html-todocbook'
pkgver='0.0301'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-getopt-argvfile>=1.09' 'perl-html-simpleparse' 'perl-xml-libxml' 'perl-xml-libxslt')
makedepends=()
url='https://metacpan.org/release/html2dbk'
source=('http://search.cpan.org/CPAN/authors/id/R/RU/RUBYKAT/html2dbk-0.0301.tar.gz')
md5sums=('150e3613abe63eacfa090a51052aab59')
sha512sums=('2ec813f067439ab8b14ab662ef4e6471118e77dfa1af4e4c7fd3934c7025fd307e92eb4f6a69642bcb6aad4da42ed7ff3c5b6fb4f5eefbb256f63fc479a2d115')
_distdir="html2dbk-0.0301"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
