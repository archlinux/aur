# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-object-id'
pkgver='0.1.2'
pkgrel='1'
pkgdesc="A unique identifier for any object"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.8' 'perl-hash-fieldhash>=0.10' 'perl-sub-name>=0.03')
makedepends=()
url='http://search.cpan.org/dist/Object-ID'
source=('http://search.cpan.org/CPAN/authors/id/M/MS/MSCHWERN/Object-ID-v0.1.2.tar.gz')
md5sums=('11bbd7d6def704e85d8875f33b2e7f66')
sha512sums=('ac43a0c1d5b789052f4740a9dc726ef8bf197d88f1a6410ad98c7d8d5371c0419d763578f19a418bdd81c8c19f8ea43a461c6bbad31a7971d13f0452b48fb206')
_distdir="Object-ID-v0.1.2"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
