# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-validate-tiny'
pkgver='0.984'
pkgrel='1'
pkgdesc="Minimalistic data validation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-list-moreutils')
makedepends=()
url='http://search.cpan.org/dist/Validate-Tiny'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MINIMAL/Validate-Tiny-0.984.tar.gz')
md5sums=('363d1de0023cc6db962ebc2e49d16538')
sha512sums=('4eca7035316468e99ed02c97a2b2b8801a94f18db46fa535c2b0267b8fb5d780091357448f6b7b63161cff8c537e2d41c49aff3176a4c0d88db4fa0a55a54b2f')
_distdir="Validate-Tiny-0.984"

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
