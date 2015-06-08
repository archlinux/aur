# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-markapl'
pkgver='0.14'
pkgrel='1'
pkgdesc="Markup as Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-b-hooks-endofscope>=0.05' 'perl-devel-declare' 'perl-exporter-lite' 'perl-html-parser' 'perl-string-bufferstack>=1.15' 'perl-sub-install')
makedepends=('perl-html-lint')
url='http://search.cpan.org/dist/Markapl'
source=('http://search.cpan.org/CPAN/authors/id/G/GU/GUGOD/Markapl-0.14.tar.gz')
md5sums=('f6e6696e115aacd96b60a5bcf59a23a4')
sha512sums=('6980539142cc76906dea76227204d5aa974a6dafa99e9fa83e4548b18be9568f41421bcba659459f39da66ab1388ff98645a2b39e51cb4c64f5d3dd7463136c4')
_distdir="Markapl-0.14"

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
