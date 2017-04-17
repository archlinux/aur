# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-file-changenotify'
pkgver='0.27'
pkgrel='1'
pkgdesc="Watch for changes to files, cross-platform style"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-load' 'perl-module-pluggable' 'perl-module-runtime' 'perl-moo>=1.006' 'perl-type-tiny' 'perl-namespace-autoclean')
makedepends=()
checkdepends=('perl-test-exception' 'perl-test-requires' 'perl-test-without-module')
url='https://metacpan.org/release/File-ChangeNotify'
source=('http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/File-ChangeNotify-0.27.tar.gz')
md5sums=('90af25499b9b41193957f8e9d9ea1107')
sha512sums=('aabdac4e32765df6828aa1cc72301ccfdd4c0547189234111f970eea0564cf0c691b3b9261fa32a298e599a3d20734488274ba88e6c25f76cfe64d58e83da426')
_distdir="File-ChangeNotify-0.27"

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
