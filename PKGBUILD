# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-form-sensible'
pkgver='0.20023'
pkgrel='1'
pkgdesc="A sensible way to handle form based user interface"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime' 'perl-datetime-format-natural' 'perl-datetime-set' 'perl-file-sharedir' 'perl-moose' 'perl-namespace-autoclean' 'perl-template-toolkit')
makedepends=()
url='http://search.cpan.org/dist/Form-Sensible'
source=('http://search.cpan.org/CPAN/authors/id/J/JA/JAYK/Form-Sensible-0.20023.tar.gz')
md5sums=('99e320a535d15bf34254e36b15825728')
sha512sums=('ff781c064951924497cd90e4b172119f44affa1bc0e505780632aad876a9d03ef437545eb9071fc7c77842c7e31c037615e8868b4f9e50d9c8afb215de071e42')
_distdir="Form-Sensible-0.20023"

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
