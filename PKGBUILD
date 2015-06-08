# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-anyevent-subprocess'
pkgver='1.102912'
pkgrel='1'
pkgdesc="flexible, OO, asynchronous process spawning and management"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-anyevent' 'perl-ev>=4.0' 'perl-event-join>=0.05' 'perl-io-tty' 'perl-json>=2' 'perl-moose>=1.15' 'perl-moosex-clone' 'perl-moosex-role-parameterized' 'perl-moosex-strictconstructor' 'perl-moosex-types' 'perl-moosex-types-signal' 'perl-namespace-autoclean' 'perl-namespace-clean' 'perl-sub-exporter' 'perl-try-tiny')
makedepends=('perl-test-exception' 'perl-test-use-ok')
url='http://search.cpan.org/dist/AnyEvent-Subprocess'
source=('http://search.cpan.org/CPAN/authors/id/J/JR/JROCKWAY/AnyEvent-Subprocess-1.102912.tar.gz')
md5sums=('3e3f95874d8fcce0a50f585682485a58')
sha512sums=('b4d72960ff5aebc5f4f0c96791e5204e87eed0ef8ac4b0f0e48a3c0397f3de053899864a6ba23741aede1187cc6bdb99433b8e55721fff4a327fee83c28459e6')
_distdir="AnyEvent-Subprocess-1.102912"

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
