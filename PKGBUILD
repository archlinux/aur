# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-github'
pkgver='0.48'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-load' 'perl-dist-zilla' 'perl-git-wrapper' 'perl-io-socket-ssl' 'perl-json-maybexs' 'perl-moose' 'perl-net-ssleay' 'perl-path-tiny' 'perl-try-tiny' 'perl')
checkdepends=('perl-test-deep' 'perl-test-deep-json' 'perl-test-fatal')
url='https://metacpan.org/release/Dist-Zilla-Plugin-GitHub'
source=('https://cpan.metacpan.org/authors/id/E/ET/ETHER/Dist-Zilla-Plugin-GitHub-0.48.tar.gz')
md5sums=('0c9d8dc40a5c991231ce3b74616cfdf2')
sha512sums=('78f488ae6c8e7f0fcb7905c5838dea245a9aec1b926a356e3bed82ec1239a9ccb5ad1624fc9ec8b56f80c462c26057f53198d7ef40b637b770b48337b5f7e433')
_distdir="Dist-Zilla-Plugin-GitHub-0.48"

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
