# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-proc-wait3'
pkgver='0.04'
pkgrel='1'
pkgdesc="Perl extension for wait3 system call"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Proc-Wait3'
source=('http://search.cpan.org/CPAN/authors/id/C/CT/CTILMES/Proc-Wait3-0.04.tar.gz')
md5sums=('d87ce5f3557eb86bfa5bafb9f2e028e3')
sha512sums=('55108f6abb8c51e23075c2ed7e0e8a112d071b224c6e85e191c1191bdbfd95603d55ae7b3e7be8d72ecffdb3cda8573e393b9da1a852eb236e6fcb9b8ce3a782')
_distdir="Proc-Wait3-0.04"

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
