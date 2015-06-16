# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-digest-md5-file'
pkgver='0.08'
pkgrel='1'
pkgdesc="Perl extension for getting MD5 sums for files and urls."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-libwww')
makedepends=()
url='http://search.cpan.org/dist/Digest-MD5-File'
source=('http://search.cpan.org/CPAN/authors/id/D/DM/DMUEY/Digest-MD5-File-0.08.tar.gz')
md5sums=('90daecd725bf77606c192f379aea1ff9')
sha512sums=('bf06d403e69f8c71d2b53fb09ae62abb56685ed321d2342cb0bed4e60dc038f460b13d45dd64598fcbc9a3291279293b55fbe69f492fa4dac0d946868901da9b')
_distdir="Digest-MD5-File-0.08"

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
