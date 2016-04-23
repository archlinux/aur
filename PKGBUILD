# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-directory-transactional'
pkgver='0.09'
pkgrel='1'
pkgdesc="ACID transactions on a directory tree"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-any-moose>=0.07' 'perl-data-guid' 'perl-data-stream-bulk' 'perl-directory-scratch' 'perl-file-nfslock' 'perl-hash-util-fieldhash-compat' 'perl-path-class' 'perl-scope-guard' 'perl-set-object' 'perl-test-exception' 'perl-test-tempdir' 'perl-namespace-clean')
makedepends=()
url='https://metacpan.org/release/Directory-Transactional'
source=('http://search.cpan.org/CPAN/authors/id/N/NU/NUFFIN/Directory-Transactional-0.09.tar.gz')
md5sums=('e065c379cbe6a54fccd42a28311de3c4')
sha512sums=('f08c5296f09604caea64085e25dc4047900dc954233db2fcf7f19a4680f37e04c1b8d841473f5a7a9ae41c0b6f4e3557b94187719ac93090618053dec1ed4c2e')
_distdir="Directory-Transactional-0.09"

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
