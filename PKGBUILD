# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-net-stomp'
pkgver='0.61'
pkgrel='1'
pkgdesc="A Streaming Text Orientated Messaging Protocol Client"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor>=0' 'perl-log-any>=1.707' 'perl-log-any-adapter-tap>=0.003003')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-fatal>=0' 'perl-test-nicedump>=1.0.0')
url='https://metacpan.org/release/Net-Stomp'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAKKAR/Net-Stomp-0.61.tar.gz')
md5sums=('c2c4fc5fa031d412e0ad7e79d097c8de')
sha512sums=('d6010916f417c28bc42d5535aee92ff5b6fec78c9a2810c8988ffc97af01b09b1fd5383f2a1a1f335de6b33cf77a572781ca9b21973b88d7b0b310909f27aa26')
_distdir="Net-Stomp-0.61"

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
