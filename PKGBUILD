# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-web-microformats2'
pkgver='0.501'
pkgrel='1'
pkgdesc="Read Microformats2 metadata from HTML or JSON"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime-format-iso8601>=0' 'perl-html-parser>=0' 'perl-html-treebuilder-xpath>=0' 'perl-json>=0' 'perl-moose>=0' 'perl-moosex-types-uri>=0' 'perl-path-class>=0' 'perl-readonly>=0' 'perl>=5.10.0' 'perl-xml-xpathengine')
makedepends=()
checkdepends=('perl-test-deep>=0')
url='https://metacpan.org/release/Web-Microformats2'
source=('https://cpan.metacpan.org/authors/id/J/JM/JMAC/Web-Microformats2-0.501.tar.gz')
md5sums=('a33f8bb28ee5c7db1342d30f23ff8d5d')
sha512sums=('94a1bc9511300379e338a934cd338293c48050fecb387426a62a5f98230d4af7452454dfb9dfe8db9e096fc689c621ce9db64644af3901dba7431d107b677261')
_distdir="Web-Microformats2-0.501"

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
