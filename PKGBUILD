# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-kiokudb-backend-files'
pkgver='0.06'
pkgrel='1'
pkgdesc="One file per object backend"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-directory-transactional>=0.06' 'perl-kiokudb>=0.24' 'perl-moose' 'perl-moosex-types-path-class')
makedepends=('perl-test-tempdir')
url='http://search.cpan.org/dist/KiokuDB-Backend-Files'
source=('http://search.cpan.org/CPAN/authors/id/N/NU/NUFFIN/KiokuDB-Backend-Files-0.06.tar.gz')
md5sums=('ebda2d19551febae41f6755d3676f49b')
sha512sums=('e4da4d719cd2d5552989830f8e7db0e5adbadc119c2ba2234b4f794e048a9673e7d918816618346789be1109f275b55f38604b41e901ade2f0838b418f4c13ce')
_distdir="KiokuDB-Backend-Files-0.06"

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
# Tests broken, upstream has not fixed the problem.
check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
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
