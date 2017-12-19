# Contributor: senorsmile
# Contributor: Max Roder <maxroder@web.de>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname=perl-bsd-resource
pkgver=1.2911
pkgrel=2
pkgdesc="getrusage(), s/getrlimit(), s/getpriority()"
arch=('x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/BSD-Resource'
source=("http://search.cpan.org/CPAN/authors/id/J/JH/JHI/BSD-Resource-${pkgver}.tar.gz")
md5sums=('3a67959a30fd6e537b9d8a64d60d8692')
sha512sums=('d0032d41c7c0468ed1c6d8f57b885f6cb97a5039d754c8cb60b2067daedaf53bd15fb6561a3d0f828df16dfa5417f663b8065ba65f4fea16dc9262728b3b6b85')
_distdir="BSD-Resource-${pkgver}"


build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
