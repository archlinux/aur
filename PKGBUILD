# Contributor: Christos Nouskas <nous@archlinux.us>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-html-wikiconverter-pmwiki'
pkgver='0.51'
pkgrel='1'
pkgdesc="Convert HTML to PmWiki markup"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-wikiconverter>=0.6')
makedepends=()
url='https://metacpan.org/release/HTML-WikiConverter-PmWiki'
source=('http://search.cpan.org/CPAN/authors/id/D/DI/DIBERRI/HTML-WikiConverter-PmWiki-0.51.tar.gz')
md5sums=('1d3147e0083d94049dba351d654496de')
sha512sums=('e0acaa13127858ded30429f2b4701fd807509d43b529eb90e4d0a17b6d2b1e3a7bc1e450fd253d72948a36577854d2729df6dc5d039913d7200e8c65b5785a17')
_distdir="HTML-WikiConverter-PmWiki-0.51"

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
