# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-crypt-gpgme'
pkgver='0.09'
pkgrel='1'
pkgdesc="Perl interface to libgpgme"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('gpgme>=1.3.2' 'libassuan>=2.1.0' 'libgpg-error>=1.11' 'perl-io-stringy')
makedepends=('perl-test-exception')
url='http://search.cpan.org/dist/Crypt-GpgME'
source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Crypt-GpgME-0.09.tar.gz')
md5sums=('5bf11c59c057df342f82fbb53f941adf')
sha512sums=('9e85012bcb3ea5dd2cdd06e780be00061f3502b70e59a36fe93db296b6b90a4d85cd5d8b28a238a51b3db3830dff552ef319c72f45d2f35246cfa2bbe7b5c324')
_distdir="Crypt-GpgME-0.09"

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
