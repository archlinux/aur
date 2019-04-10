# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-github'
pkgver='0.47'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-load>=0' 'perl-dist-zilla>=0' 'perl-git-wrapper>=0' 'perl-io-socket-ssl>=1.56' 'perl-json-maybexs>=0' 'perl-moose>=0' 'perl-net-ssleay>=1.49' 'perl-path-tiny>=0' 'perl-try-tiny>=0' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-deep-json>=0' 'perl-test-fatal>=0')
url='https://metacpan.org/release/Dist-Zilla-Plugin-GitHub'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Dist-Zilla-Plugin-GitHub-0.47.tar.gz')
md5sums=('a77e2dd6d70bdf00bf90bc622c7a92d1')
sha512sums=('afa08e608245b6b3989566c7bca555fa57d63bc3c3e0b1c7a576da6ec9905f8f0ea79d2f1bb1552980adea4ab4e784e7283990079f94acff63df724834b36fb8')
_distdir="Dist-Zilla-Plugin-GitHub-0.47"

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
