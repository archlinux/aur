# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-podweaver'
pkgver='4.009'
pkgrel='1'
pkgdesc="weave your Pod together from configuration and Dist::Zilla"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla>=5' 'perl-file-find-rule>=0' 'perl-moose>=0' 'perl-ppi>=0' 'perl-pod-elemental-perlmunger>=0.1' 'perl-pod-weaver>=4' 'perl-namespace-autoclean>=0')
url='https://metacpan.org/release/Dist-Zilla-Plugin-PodWeaver'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Dist-Zilla-Plugin-PodWeaver-4.009.tar.gz')
md5sums=('bd9125b86745fe76f869fa0bedd2f505')
sha512sums=('7ed77a66f491cd557c9149b0657a419a553140cf2dcd8037463757b62a0e5523748d6320e491d3ac416e37f5b8fbc829de4bf4c1d6b0f3f40f631ad34c2d1329')
_distdir="Dist-Zilla-Plugin-PodWeaver-4.009"

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
