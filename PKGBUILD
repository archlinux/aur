# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-poe-component-sslify'
pkgver='1.008'
pkgrel='1'
pkgdesc="Makes using SSL in the world of POE easy!"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-net-ssleay>=1.36' 'perl-poe' 'perl-task-weaken>=1.03')
makedepends=()
url='http://search.cpan.org/dist/POE-Component-SSLify'
source=('http://search.cpan.org/CPAN/authors/id/A/AP/APOCAL/POE-Component-SSLify-1.008.tar.gz')
md5sums=('a7b8d0276b7c171485cbca086b147c5d')
sha512sums=('73c3952bb2763352b0a4b48817e01b0ed9c19caafb6eca80e0773b558a481fe0a255f718f20ea7a474f8e8f8d1c65e3b2fa7950dd0c624aca9011d99ed5b2dde')
_distdir="POE-Component-SSLify-1.008"

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
