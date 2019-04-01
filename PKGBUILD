# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-podweaver'
pkgver='4.008'
pkgrel='1'
pkgdesc="weave your Pod together from configuration and Dist::Zilla"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla>=5' 'perl-file-find-rule>=0' 'perl-moose>=0' 'perl-ppi>=0' 'perl-pod-elemental-perlmunger>=0.1' 'perl-pod-weaver>=4' 'perl-namespace-autoclean>=0')
makedepends=()
url='https://metacpan.org/release/Dist-Zilla-Plugin-PodWeaver'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Dist-Zilla-Plugin-PodWeaver-4.008.tar.gz')
md5sums=('b3fb0f665cace2ad3d134f626c2546aa')
sha512sums=('e780dc2269b9691d0c334866c278fd2dea2eb68a3d84a5c8dad80b2b9277a7396e523a2b8c45b32d7c8b7b1379b7e3f7d68871b40901d3fa3a2bb0d039e824e5')
_distdir="Dist-Zilla-Plugin-PodWeaver-4.008"

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
