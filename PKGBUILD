# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-net-z3950-simpleserver'
pkgver='1.29'
pkgrel='1'
pkgdesc="Simple Perl API for building Z39.50 servers."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0' 'glibc>=2.40+r16+gaa533d58ff' 'libxml2>=2.13.4' 'libxml2>=2.13.4' 'libxslt>=1.1.42' 'libxslt>=1.1.42' 'libxslt>=1.1.42' 'libxslt>=1.1.42' 'yaz>=5.34.0' 'yaz>=5.34.0' 'yaz>=5.34.0' 'yaz>=5.34.0')
makedepends=()
url='https://metacpan.org/release/Net-Z3950-SimpleServer'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIRK/Net-Z3950-SimpleServer-1.29.tar.gz')
md5sums=('6fe2b1b4f46f1e72d4485648190ff254')
sha512sums=('dad4e75a3323d738123c0ebf77dae8576180a3b41d47821779d1f116dc9d239e1fe07f2d620e3212935743d6d0560ff8246c69125d366b90f3e17cc6de31375f')
_distdir="Net-Z3950-SimpleServer-1.29"

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
