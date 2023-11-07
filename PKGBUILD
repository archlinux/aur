# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-netpacket'
pkgver='1.7.2'
pkgrel='1'
pkgdesc="assemble/disassemble network packets at the protocol level"
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl>=5.10.0')
makedepends=()
url='https://metacpan.org/release/NetPacket'
source=('http://search.cpan.org/CPAN/authors/id/Y/YA/YANICK/NetPacket-1.7.2.tar.gz')
md5sums=('6821d0c7a553308cdcd868737055bb3d')
sha512sums=('94fb9b99f8d5443cce76c943ab562b44ee07448b0fbdd86bea35e0dc1aeabbce3871d7115f68c8ca013ad71390c51f2d5233a8f4ad71d796920c3f286cecf4c5')
_distdir="NetPacket-1.7.2"

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
