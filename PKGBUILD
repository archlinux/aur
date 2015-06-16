# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-text-recordparser'
pkgver='1.6.3'
pkgrel='1'
pkgdesc="read record-oriented files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor>=0' 'perl-io-stringy>=0' 'perl-list-moreutils>=0' 'perl-pod-markdown>=0' 'perl-pod-readme>=0' 'perl-readonly>=0' 'perl-text-autoformat>=0')
makedepends=()
checkdepends=('perl-test-exception>=0')
url='http://search.cpan.org/dist/Text-RecordParser'
source=('http://search.cpan.org/CPAN/authors/id/K/KC/KCLARK/Text-RecordParser-v1.6.3.tar.gz')
md5sums=('86659b7a16726b951870f1025681adc2')
sha512sums=('3cc7e14998a49282ace755d99fd7118b885dd897e29d522018d8fac3cb81a68482817d3714ff8fb6e54fb66d50c6d14b0d17593d32ef9872247402c171a3ae7e')
_distdir="Text-RecordParser-v1.6.3"

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
