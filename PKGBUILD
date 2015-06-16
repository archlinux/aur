# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-crypt-cracklib'
pkgver='1.7'
pkgrel='1'
pkgdesc="Perl interface to Alec Muffett's Cracklib."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('cracklib>=2.8.22' 'perl>=5.005')
makedepends=('perl-pod-coverage>=0.19' 'perl-test-pod-coverage>=1.08')
url='http://search.cpan.org/dist/Crypt-Cracklib'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DANIEL/Crypt-Cracklib-1.7.tar.gz')
md5sums=('8179f32d7470780e001532bcb6cb4080')
sha512sums=('1364fb75bf363d81d418c2f0590dbe6f889ffc5db2a467931d5ef9221c1c762244eae34016a0c0ad57a12aeaa108ad22b3ab67cb8b28beb2f486d13e497f8e13')
_distdir="Crypt-Cracklib-1.7"

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
