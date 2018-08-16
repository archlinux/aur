# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-lingua-en-inflect'
pkgver='1.903'
pkgrel='1'
pkgdesc="Perl/CPAN Module Lingua::EN::Inflect: Convert singular to plural. Select \"a\" or \"an\"."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Lingua-EN-Inflect'
source=("http://search.cpan.org/CPAN/authors/id/D/DC/DCONWAY/Lingua-EN-Inflect-${pkgver}.tar.gz")
md5sums=('b92bebce0a8cbc578fbae485ed4cd07d')
sha512sums=('2f629e1dd9eddba123423c95531907a7c0a7eb0bc99ee425ea2c3cdb4059af0e78625c45392eb65780c8b06da8eec790e242d51912c87a15bcf5d466d68549ce')
_distdir="Lingua-EN-Inflect-${pkgver}"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
