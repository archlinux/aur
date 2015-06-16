# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-furl'
pkgver='2.17'
pkgrel='1'
pkgdesc="Lightning-fast URL fetcher"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-class-accessor-lite' 'perl-http-parser-xs>=0.11' 'perl-mozilla-ca')
makedepends=('perl-test-requires' 'perl-test-tcp>=1.06')
url='http://search.cpan.org/dist/Furl'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOKUHIROM/Furl-2.17.tar.gz')
md5sums=('c2572c1e7ec58651adfbcbe0d6178a06')
sha512sums=('305a2f66d97cf33c9fe311e40ce11877f59591d4e483c22af8bf1e274fa393ed3fad9567c274932c87bdd60aee3b9bd5d43e3e145fa0c247cd4d9a5971b18d36')
_distdir="Furl-2.17"

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
