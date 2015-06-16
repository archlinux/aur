# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-poe-component-jabber'
pkgver='3.00'
pkgrel='1'
pkgdesc="A POE Component for communicating over Jabber"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.0' 'perl-authen-sasl>=2.12' 'perl-digest-sha1>=2.11' 'perl-poe>=1.003' 'perl-poe-component-sslify>=0.15' 'perl-poe-filter-xml>=0.35')
makedepends=()
url='http://search.cpan.org/dist/POE-Component-Jabber'
source=('http://search.cpan.org/CPAN/authors/id/N/NP/NPEREZ/POE-Component-Jabber-3.00.tar.gz')
md5sums=('821500f5938b30db17cb496ae4006d73')
sha512sums=('a7fff4b5854d82c5948d874a4931b6fd6650661bfae9ed2a72028fb6c122da3370b91a5c6b95b5342c02000154d8c11c6dccfd0b2d65992ad54d7e569f61f994')
_distdir="POE-Component-Jabber-3.00"

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
