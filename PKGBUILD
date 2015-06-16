# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-plugin-session-store-file'
pkgver='0.18'
pkgrel='1'
pkgdesc="File storage backend for session data."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cache-cache>=1.02' 'perl-catalyst-plugin-session>=0.27' 'perl-catalyst-runtime>=5.7000' 'perl-class-data-inheritable>=0.04' 'perl-mro-compat>=0.10')
makedepends=()
url='http://search.cpan.org/dist/Catalyst-Plugin-Session-Store-File'
source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Catalyst-Plugin-Session-Store-File-0.18.tar.gz')
md5sums=('ab6912c5d8a4eeedc7d603e5bb0a47cf')
sha512sums=('cd57f24c75304952989147b39ca542aed8d1ab448e77cba876b34f8bf0ba3859f5b0ac7a10dd480eadb2046037ecdd137bea1a2ea7ecc67dec2f49989bde3118')
_distdir="Catalyst-Plugin-Session-Store-File-0.18"

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
