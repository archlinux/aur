# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-net-z3950-simpleserver'
pkgver='1.21'
pkgrel='1'
pkgdesc="Simple Perl API for building Z39.50 servers. "
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0' 'glibc>=2.36' 'libxml2>=2.10.3' 'libxml2>=2.10.3' 'libxslt>=1.1.37' 'libxslt>=1.1.37' 'libxslt>=1.1.37' 'libxslt>=1.1.37' 'yaz>=5.32.0' 'yaz>=5.32.0' 'yaz>=5.32.0' 'yaz>=5.32.0')
makedepends=()
url='https://metacpan.org/release/Net-Z3950-SimpleServer'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIRK/Net-Z3950-SimpleServer-1.21.tar.gz')
md5sums=('52fe53878bab716e54bee290f800ae9a')
sha512sums=('ebd789b49b2d3a2fb0f78f1bc7bbbf28fe22ff1a5cbad92b09103a1b75a309e1bcef4b4bc8540c0e5a4a1e83f77ecbf848df46447bf58aa4457276caf829acb9')
_distdir="Net-Z3950-SimpleServer-1.21"

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
