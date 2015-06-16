# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-net-telnet-cisco'
pkgver='1.10'
pkgrel='1'
pkgdesc="interact with a Cisco router"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-net-telnet>=3.02' 'perl-term-readkey')
makedepends=()
url='http://search.cpan.org/dist/Net-Telnet-Cisco'
source=('http://search.cpan.org/CPAN/authors/id/J/JO/JOSHUA/Net-Telnet-Cisco-1.10.tar.gz')
md5sums=('a25845350be369cb8354e0ddc55708f9')
sha512sums=('1fcae8e54425a2ddf2e32c772886af97d308421eb664abb296ec16e97531c2eb6727ea4607d48fa957e9a926dc5b88bfffdfa75da10793f4f0247fa3b1f45672')
_distdir="Net-Telnet-Cisco-1.10"

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
