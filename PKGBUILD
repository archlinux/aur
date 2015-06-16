# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-cpan-meta-yaml'
pkgver='0.22'
pkgrel='1'
pkgdesc="Validate your CPAN META.yml files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-test-yaml-valid>=0.03')
makedepends=()
url='http://search.cpan.org/dist/Test-CPAN-Meta-YAML'
source=('http://search.cpan.org/CPAN/authors/id/B/BA/BARBIE/Test-CPAN-Meta-YAML-0.22.tar.gz')
md5sums=('c5acd14f7ecbe1dbf21cc3548ee3dfef')
sha512sums=('3570c29066ec2655d921f35742a106ba178fc12c9127ffe59b0803ebcb64c626010192ef9584cc6f5863aafdbf4d83d042969f9f456c2bc2e8f8e67bc46d0a2f')
_distdir="Test-CPAN-Meta-YAML-0.22"

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
