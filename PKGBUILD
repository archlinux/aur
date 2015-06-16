# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-digest-skein'
pkgver='0.05'
pkgrel='1'
pkgdesc="Perl interface to the Skein digest algorithm"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Digest-Skein'
source=('http://search.cpan.org/CPAN/authors/id/R/RA/RADEK/Digest-Skein-0.05.tar.gz')
md5sums=('cb7ff5208a078e5e504715e6486a06d5')
sha512sums=('6c3ef28cd2033ba20ce4a9f246ed6c8dbdac2d137f82f3ac00e02a304a0fb71ffb36e8d5a54c6c51ad6325decd2fb82b4362858b78e8bf160634a4b0ffcc9739')
_distdir="Digest-Skein-0.05"

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
