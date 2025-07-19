# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-kwalitee'
pkgver='1.28'
pkgrel='4'
pkgdesc="Test the Kwalitee of a distribution before you release it"
arch=('any')
license=('Artistic-1.0-Perl'
         'GPL-1.0-only')
options=('!emptydirs')
depends=('perl-cpan-meta-check>=0.011' 'perl-module-cpants-analyse>=0.92' 'perl-test-deep>=0' 'perl-test-warnings>=0.009' 'perl>=5.006')
checkdepends=('perl-parse-distname>=0.05' 'perl-algorithm-diff>=1:1.201' 'perl-class-xsaccessor>=1.19')
url='https://metacpan.org/release/Test-Kwalitee'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Test-Kwalitee-1.28.tar.gz')
sha512sums=('155d029ae92365c719720db0252a0a9edf731280409c4c2a5e787d44c18c6d999d8018e83ee85b4fba5569b5dc8bfa1851080825b31d269ac58c8d6e26de2f26')
_distdir="Test-Kwalitee-1.28"

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
