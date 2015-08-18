# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-file-sharedir-projectdistdir'
pkgver='1.000008'
pkgrel='1'
pkgdesc="Simple set-and-forget using of a '/share' directory in your projects root"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-tiny' 'perl-file-sharedir' 'perl-path-finddev' 'perl-path-isdev' 'perl-path-tiny' 'perl-sub-exporter' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/File-ShareDir-ProjectDistDir'
source=('http://search.cpan.org/CPAN/authors/id/K/KE/KENTNL/File-ShareDir-ProjectDistDir-1.000008.tar.gz')
md5sums=('9ba30f1bcf34a54be4567b8e121ef3da')
sha512sums=('20cd450926d1f054c6c6d55392b51370f83d1106048f8661a55c05483d1c16d41f388e99a14209d84dcc20b1bb855a3c305c286216e9fec2062f8bd1f29ff930')
_distdir="File-ShareDir-ProjectDistDir-1.000008"

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
