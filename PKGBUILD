# Contributor: Caleb Maclennan <caleb@alerque.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-yaml-merge-simple'
pkgver='0.01'
pkgrel='1'
pkgdesc="Recursively merge two or more YAMLs, simply"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-hash-merge-simple' 'perl-yaml-libyaml' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/YAML-Merge-Simple'
source=('http://search.cpan.org/CPAN/authors/id/A/AN/ANDREFS/YAML-Merge-Simple-0.01_01.tar.gz')
sha512sums=('0a1a9c9ac1e347bd96c293fffd724592fc38dfaa3bbb0581059f289b606496ebbd5a7d4e7310bdbc781ff9a1b768f1cd323f555b408dbced65b7183850cb9b2a')
_distdir="YAML-Merge-Simple-0.01_01"

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
