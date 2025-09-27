# Maintainer: René Wagner <rwagner at rw-net dot de>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-file-changenotify'
pkgver='0.31'
pkgrel='2'
pkgdesc="Watch for changes to files, cross-platform style"
arch=('any')
license=('Artistic-2.0')
options=('!emptydirs')
depends=('perl-class-load' 'perl-module-pluggable' 'perl-module-runtime' 'perl-moo>=1.006' 'perl-type-tiny' 'perl-namespace-autoclean')
checkdepends=('perl-test-exception' 'perl-test-requires' 'perl-test-without-module')
url='https://metacpan.org/release/File-ChangeNotify'
source=('http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/File-ChangeNotify-0.31.tar.gz')
sha512sums=('0dc7c1c2a3887c09f59465a89f52c4c8a9426e96574fa4764fe90a5f1500541ddbcb233bfcd206c76e0b7dfedf2980b3dc54fab6b45608a5b6fb82143172b25b')
_distdir="File-ChangeNotify-0.31"

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
