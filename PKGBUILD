# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-plugin-session-dynamicexpiry'
pkgver='0.04'
pkgrel='1'
pkgdesc="per-session custom expiry times"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-plugin-session>=0.11' 'perl-catalyst-runtime>=5.80' 'perl-moose' 'perl-mro-compat' 'perl-namespace-autoclean' 'perl-try-tiny')
makedepends=()
url='http://search.cpan.org/dist/Catalyst-Plugin-Session-DynamicExpiry'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/Catalyst-Plugin-Session-DynamicExpiry-0.04.tar.gz')
md5sums=('88f15124e1deaf7a9056688059636bfb')
sha512sums=('8ceb7d46bef80f3a59f35ff6342acff601dc90874df9f828973aa42c1428a1b488fbf7c34b67a1fa7c4882578f095ac088a79c58698b042bac7b1af3617c2db8')
_distdir="Catalyst-Plugin-Session-DynamicExpiry-0.04"

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
