# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-web-microformats2'
pkgver='0.511'
pkgrel='2'
pkgdesc="Read Microformats2 metadata from HTML or JSON"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime-format-iso8601>=0' 'perl-html-parser>=0' 'perl-html-treebuilder-xpath>=0' 'perl-json>=0' 'perl-moo>=0' 'perl-moox-handlesvia>=0' 'perl-path-class>=0' 'perl-readonly>=0' 'perl-type-tiny>=0' 'perl-uri>=0' 'perl>=5.10.0')
makedepends=('perl-module-build-tiny')
checkdepends=('perl-test-deep>=0')
url='https://metacpan.org/release/Web-Microformats2'
source=("http://search.cpan.org/CPAN/authors/id/J/JM/JMAC/Web-Microformats2-$pkgver.tar.gz")
md5sums=('d4e81687ec479139340076e47ad58950')
sha512sums=('91cfd8e2e0c6f70c3027871c92c70b5901a862e3d7b1543708c0ef9eadeac8be530c42e4ae3af32af40bae82fefd8f95b6926f540e219208b833abc93d07c7e8')
_distdir="Web-Microformats2-$pkgver"

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
