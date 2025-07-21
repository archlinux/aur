# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-web-mention'
pkgver='0.721'
pkgrel='3'
pkgdesc="Implementation of the IndieWeb Webmention protocol"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-datetime>=0' 'perl-datetime-format-iso8601>=0' 'perl-http-link>=0' 'perl-json>=0' 'perl-lwp-protocol-https>=0' 'perl-mojo-dom58>=0' 'perl-moo>=0' 'perl-moox-classattribute>=0' 'perl-moox-enumeration>=0' 'perl-moox-handlesvia>=0' 'perl-path-class>=0' 'perl-readonly>=0' 'perl-string-truncate>=0' 'perl-try-tiny>=0' 'perl-type-tiny>=0' 'perl-uri>=0' 'perl-web-microformats2>=0.5' 'perl-libwww>=0' 'perl>=5.10.0')
makedepends=()
checkdepends=('perl-test-exception>=0' 'perl-test-lwp-useragent>=0' 'perl-test-warn>=0')
url='https://metacpan.org/release/Web-Mention'
source=("http://search.cpan.org/CPAN/authors/id/J/JM/JMAC/Web-Mention-$pkgver.tar.gz")
md5sums=('7622f6ee5ecb105ba549a3c209b0a105')
sha512sums=('3b6ceb3e982bf7242d5244dd3d0fdf264c416f2835b19df6f2c2b92d1d5f8aac9a87d615b408c1610dd4dd3d245ad22b53a02314432af3c961780317577ac272')
_distdir="Web-Mention-$pkgver"

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
