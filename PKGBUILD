# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-net-address-ip-local'
pkgver='0.1.2'
pkgrel='1'
pkgdesc="A class for discovering the local system's IP address"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-error')
makedepends=()
url='http://search.cpan.org/dist/Net-Address-IP-Local'
source=('http://search.cpan.org/CPAN/authors/id/J/JM/JMEHNLE/net-address-ip-local/Net-Address-IP-Local-0.1.2.tar.gz')
md5sums=('404662cd2b96cbe4a1102bc5d525f727')
sha512sums=('98f65c05467ce82ab45b6f9ded6a38f5c2ef6c42f94cb59a72f1b8c4660177494b606f8170812fcb37a9b49b0427d31454f6fbd094dab9877b331a24a324fb05')
_distdir="Net-Address-IP-Local-0.1.2"

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
