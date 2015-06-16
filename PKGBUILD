# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-dist-zilla-plugin-copyto'
pkgver='0.11'
pkgrel='1'
pkgdesc="Copy to Other Places Plugin for Dist::Zilla"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla')
makedepends=()
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-CopyTo'
source=('http://search.cpan.org/CPAN/authors/id/R/RE/REDICAPS/Dist-Zilla-Plugin-CopyTo-0.11.tar.gz')
md5sums=('00aa852b2b22c7f022f96075b6ffb697')
sha512sums=('c700575196e5e22bae66a8d8c745ace679bbab0f82a02146c4371cff08ada899209e38aed9dd1e4e78edcee0428198c572d3b4f2b3a9e82bf2af3b9b6a783932')
_distdir="Dist-Zilla-Plugin-CopyTo-0.11"

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
