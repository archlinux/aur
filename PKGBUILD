# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-extractmain'
pkgver='0.63'
pkgrel='1'
pkgdesc="Extract the main content of a web page"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-slurp>=9999.12' 'perl-html-format' 'perl-html-tree' 'perl-object-destroyer>=2')
makedepends=()
url='http://search.cpan.org/dist/HTML-ExtractMain'
source=('http://search.cpan.org/CPAN/authors/id/A/AN/ANIRVAN/HTML-ExtractMain-0.63.tar.gz')
md5sums=('c800b7fa16d09ce08e0386662d6e0f8c')
sha512sums=('9977fada452f8fde0bb6ae802902e8c171185d1eaf75519dbfc6c6a553376ace7513e3979170c18d96b368ff9a40953ea91f4de4a6fa9bc27f33efda7ff9122e')
_distdir="HTML-ExtractMain-0.63"

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
