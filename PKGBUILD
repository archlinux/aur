# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-pocketio'
pkgver='0.15'
pkgrel='1'
pkgdesc="Socket.IO Plack app"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.7' 'perl-anyevent' 'perl-json>=2.53' 'perl-protocol-socketio>=0.04' 'perl-protocol-websocket>=0.009006')
makedepends=('perl-test-tcp')
url='http://search.cpan.org/dist/PocketIO'
source=('http://search.cpan.org/CPAN/authors/id/V/VT/VTI/PocketIO-0.15.tar.gz')
md5sums=('0c1d4f693f7198d08b0cc8c3b950ad62')
sha512sums=('83a751b7fd685f6d57de7fea79eade5632d12f086bc4d76a1d498396be3ac0dfe2e0013e18a39ee1334af2fdb9601910a4630603f9c0b072c0087b0efae22d98')
_distdir="PocketIO-0.15"

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
