# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-web-mention'
pkgver='0.703'
pkgrel='1'
pkgdesc="Implementation of the IndieWeb Webmention protocol"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime>=0' 'perl-http-link>=0' 'perl-json>=0' 'perl-lwp-protocol-https>=0' 'perl-mojo-dom58>=0' 'perl-moose>=0' 'perl-moosex-classattribute>=0' 'perl-moosex-enumeration>=0' 'perl-moosex-types-uri>=0' 'perl-path-class>=0' 'perl-readonly>=0' 'perl-string-truncate>=0' 'perl-try-tiny>=0' 'perl-type-tiny>=0' 'perl-uri>=0' 'perl-web-microformats2>=0.5' 'perl-libwww>=0' 'perl>=5.10.0')
makedepends=()
checkdepends=('perl-test-exception>=0' 'perl-test-lwp-useragent>=0' 'perl-test-warn>=0')
url='https://metacpan.org/release/Web-Mention'
source=('https://cpan.metacpan.org/authors/id/J/JM/JMAC/Web-Mention-0.703.tar.gz')
md5sums=('06f629a5ea65993ed0872700d0d806e4')
sha512sums=('69fd2fd9a4db8999449dbacd51d3a8a1376d043f7a1c16026e6bb8e526cb523ef24e0463f6f21241919304e4de66382ed513294dd16c46e34af73a71fa9706e1')
_distdir="Web-Mention-0.703"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
   /usr/bin/perl Build.PL
   /usr/bin/perl Build
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  /usr/bin/perl Build test
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
