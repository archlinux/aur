# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-web-simple'
pkgver='0.030'
pkgrel='1'
pkgdesc="A quick and easy way to build simple web applications"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-dumper-concise>=2.020' 'perl-moo>=0.009014' 'perl-plack>=0.9968' 'perl-syntax-keyword-gather>=1.001' 'perl>=5.006' 'perl-strictures>=1' 'perl-warnings-illegalproto')
makedepends=()
url='http://search.mcpan.org/dist/Web-Simple'
source=('http://search.mcpan.org/CPAN/authors/id/M/MS/MSTROUT/Web-Simple-0.030.tar.gz')
md5sums=('281e4a8c40d8ad26067a2e1e657b1df4')
sha512sums=('afb9f3c64ca23e21e0d8850f9c0eeae7b15f9a134c088f22fedbc414a1180f6797ce0030ac2701c2cd934dd99cb58a765d8dbd21a064cbff3fd9cbd8badfab92')
_distdir="Web-Simple-0.030"

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
